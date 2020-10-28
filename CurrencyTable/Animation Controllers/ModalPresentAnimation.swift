//
//  ModalPresentAnimation.swift
//  CurrencyTable
//
//  Created by Aysel Heydarova on 10/26/20.
//

import UIKit

class ModalPresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.5
    
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
        containerView.addSubview(toVC.view)
        
        let finalFrame = transitionContext.finalFrame(for: toVC)
        let initialFrame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height), size: finalFrame.size)
        
        toVC.view.frame = initialFrame
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseInOut) {
            fromVC.view.backgroundColor = UIColor.gray
            toVC.view.frame = finalFrame
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
}
