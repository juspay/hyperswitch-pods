//
//  PaymentSheetView.swift
//  hyperswitch
//
//  Created by Balaganesh on 13/12/22.
//

import Foundation

extension PaymentSheet {
    func getRootView() -> RCTRootView {
        
        let configuration = self.configuration.toDictionary()
        
        // TODO: Remove this later
        if let jsonData = try? JSONSerialization.data(withJSONObject: configuration, options: .prettyPrinted) {
            let jsonString = String(data: jsonData, encoding: .utf8)
            print("Configuration JSON : \(jsonString ?? "")")
        }
        
        var SDKAvailable: [String : Any] = [:]
        #if canImport(Braintree)
        SDKAvailable["paypal"] = true
        #else
        SDKAvailable["paypal"] = false
        #endif
        
        let rootView =  RNViewManager.sharedInstance.viewForModule("hyperSwitch", initialProperties:
                                                                    ["props":
                                                                        [
                                                                            "configuration": configuration,
                                                                            "type":"payment",
                                                                            "clientSecret": self.intentClientSecret,
                                                                            "publishableKey": STPAPIClient.shared.publishableKey ?? "",
                                                                            "appId" : Bundle.main.bundleIdentifier ?? "",
                                                                            "isSDKAvailable" : SDKAvailable
                                                                        ]
                                                                    ])
        
        rootView.backgroundColor = UIColor.clear
        return rootView
    }
}
