//
//  ModalDismissAnimation.swift
//  CurrencyTable
//
//  Created by Aysel Heydarova on 10/26/20.
//

import UIKit

class ModalDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var interactionController: SwipeInteractionController?
    
    init(interactionController: SwipeInteractionController?){
        self.interactionController = interactionController
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to)
        else {
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(fromVC.view)
        
        let initialFrame = fromVC.view.frame
        let finalFrame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height), size: initialFrame.size)
        
        fromVC.view.frame = initialFrame
                                
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: .curveEaseInOut
        ) {
            toVC.view.backgroundColor = UIColor.white
            fromVC.view.frame = finalFrame
        } completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
