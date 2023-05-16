//
//  PaymentSheetView+SwiftUI.swift
//  hyperswitch
//
//  Created by Balaganesh on 09/12/22.
//

import Foundation
import SwiftUI

extension PaymentSheet {
    
    @available(iOS 13.0, *)
    public struct PaymentButton<Content: View>: View {
        private let paymentSheet: PaymentSheet
        private let content: Content
        
        @Environment(\.viewController) private var viewControllerHolder: UIViewController?
        
        public init(
            paymentSheet: PaymentSheet,
            onCompletion: @escaping (PaymentSheetResult) -> Void,
            @ViewBuilder content: () -> Content
        ) {
            self.paymentSheet = paymentSheet
            self.paymentSheet.completion = onCompletion
            self.content = content()
        }
        
        public var body: some View {
            Button(action: {
                RNViewManager.sharedInstance.responseHandler = self.paymentSheet
                self.viewControllerHolder?.present(style: .overCurrentContext) {
                    PaymentSheetPresenter(paymentSheet: self.paymentSheet)
                }
            }) {
                content
            }
        }
    }
    
    @available(iOS 13.0, *)
    struct PaymentSheetPresenter: UIViewRepresentable {
        
        private let paymentSheet: PaymentSheet
        
        init(paymentSheet: PaymentSheet) {
            self.paymentSheet = paymentSheet
        }
        
        typealias UIViewType = RCTRootView
        
        func makeUIView(context: Context) -> RCTRootView {
            
            return self.paymentSheet.getRootView()
        }
        
        func updateUIView(_ uiView: RCTRootView, context: Context) {
            
        }
    }
}
