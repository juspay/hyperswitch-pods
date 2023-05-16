//
//  STPPaymentCardTextField+SwiftUI.swift
//  hyperswitch
//
//  Created by Harshit Srivastava on 10/05/23.
//

import SwiftUI
import Combine

extension STPPaymentCardTextField {
    
    @available(iOS 13.0, *)
    struct Representable: UIViewRepresentable {
        @Binding var paymentMethodParams: STPPaymentMethodParams?
        
        typealias UIViewType = STPPaymentCardTextField
        
        public init(paymentMethodParams: Binding<STPPaymentMethodParams?>) {
            _paymentMethodParams = paymentMethodParams
        }
        
        func makeUIView(context: Context) -> STPPaymentCardTextField {
            let cardTextField = STPPaymentCardTextField()
            cardTextField.setContentHuggingPriority(.defaultHigh, for: .vertical)
            return cardTextField
        }
        
        func updateUIView(_ uiView: STPPaymentCardTextField, context: Context) {
            
        }
    }
}
@available(iOS 13.0, *)
extension View {
    public func paymentConfirmationSheet(
        isConfirmingPayment: Binding<Bool>,
        paymentIntentParams: STPPaymentIntentParams,
        onCompletion: @escaping STPPaymentHandler.STPPaymentHandlerActionPaymentIntentCompletionBlock
    ) -> some View {
        self.modifier(PaymentConfirmationModifier(isConfirmingPayment: isConfirmingPayment, paymentIntentParams: paymentIntentParams, onCompletion: onCompletion))
    }
}
@available(iOS 13.0, *)
struct PaymentConfirmationModifier: ViewModifier {
    @Binding var isConfirmingPayment: Bool
    let paymentIntentParams: STPPaymentIntentParams
    let onCompletion: STPPaymentHandler.STPPaymentHandlerActionPaymentIntentCompletionBlock
    
    func body(content: Content) -> some View {
        content
            .onReceive(Just(isConfirmingPayment)) { newValue in
                if newValue {
                    DispatchQueue.main.async {
                        STPPaymentHandler.sharedHandler.confirmPayment(paymentIntentParams, with: UIViewController(), completion: onCompletion)
                        isConfirmingPayment = false
                    }
                }
            }
    }
}