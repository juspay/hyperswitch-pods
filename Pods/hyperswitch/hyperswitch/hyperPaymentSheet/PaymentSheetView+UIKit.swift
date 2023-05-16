//
//  PaymentSheetView+UIKit.swift
//  hyperswitch
//
//  Created by Balaganesh on 13/12/22.
//

import Foundation

extension PaymentSheet {
    public func present(from presentingViewController: UIViewController, completion: @escaping (PaymentSheetResult) -> ()) {
        
        self.completion = completion
        
        RNViewManager.sharedInstance.responseHandler = self
        
        let paymentSheetViewController = UIViewController()
        paymentSheetViewController.view.backgroundColor = .clear
        paymentSheetViewController.modalPresentationStyle = .overFullScreen
        paymentSheetViewController.view = self.getRootView()
        
        presentingViewController.present(paymentSheetViewController, animated: false)
    }
}
