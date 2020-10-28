//
//  SwipeInteractionController.swift
//  CurrencyTable
//
//  Created by Aysel Heydarova on 10/27/20.
//

import UIKit

class SwipeInteractionController: UIPercentDrivenInteractiveTransition {

    var viewController: UIViewController!
    var interactionInProgress = false
    var shouldCompleteTransition = false

    
    init(viewController: UIViewController){
        super.init()
        
        self.viewController = viewController
        prepareGestureRecognizer(in: viewController.view )
    }
    
    func prepareGestureRecognizer(in view: UIView){
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        view.addGestureRecognizer(panGesture)
        
    }
    
    func finishAnimation(shouldFinish: Bool) {
        if shouldFinish {
            finish()
        } else {
            cancel()
        }
    }
    
    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer){
        
        let translationY = gestureRecognizer.translation(in: viewController.view).y
        let percent =  translationY  / (viewController.view.frame.height - 50)
        
        switch gestureRecognizer.state {
        case .began:
            interactionInProgress = true
            viewController.dismiss(animated: true, completion: nil)
            
        case .changed:
            shouldCompleteTransition = percent > CGFloat(0.25)
            update(percent)
        case .cancelled:
            interactionInProgress = false
            cancel()
        case .ended:
            interactionInProgress = false
            finishAnimation(shouldFinish: shouldCompleteTransition)
        default:
           break
        }
    }
}
