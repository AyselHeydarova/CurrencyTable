//
//  AccountsVC.swift
//  CurrencyTable
//
//  Created by Aysel Heydarova on 10/22/20.
//

import UIKit

class AccountsVC: UIViewController {
    
    @IBOutlet weak var button: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectCurrencyButtonTapped(_ sender: Any) {
        let currenciesVC = storyboard?.instantiateViewController(identifier: "CurrencyViewController") as! CurrencyViewController
        currenciesVC.modalPresentationStyle = .overCurrentContext
        currenciesVC.transitioningDelegate = self
        present(currenciesVC, animated: true)
    }
    
}

extension AccountsVC: UIViewControllerTransitioningDelegate {
    
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModalPresentAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let modalVC = dismissed as? CurrencyViewController else { return nil}
        
        return ModalDismissAnimation(interactionController: modalVC.swipeInteractionController)
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
       
        guard let animator = animator as? ModalDismissAnimation,
              let interactionController  = animator.interactionController,
              interactionController.interactionInProgress
        else {
            return nil
        }
            return interactionController
    }
}




