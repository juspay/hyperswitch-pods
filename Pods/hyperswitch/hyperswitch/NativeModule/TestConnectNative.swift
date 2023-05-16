import Foundation
import React

@objc(TestConnectNative)
class TestConnectNative: RCTEventEmitter {
    
    let applePayPaymentHandler = ApplePayHandler()
    public static var shared:TestConnectNative?
    
    override init() {
        super.init()
        TestConnectNative.shared = self
    }
    
    @objc
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc override func supportedEvents() -> [String] {
        return ["confirm"]
    }
    
    @objc func confirm(data: [String: Any]) {
        self.sendEvent(withName: "confirm", body: data)
    }
    
    @objc
    func sendMessageToNative(_ rnMessage: String) {
        print("This log is from swift: \(rnMessage)")
    }
    
    @objc
    func sendCallbackToNative(_ rnCallback: RCTResponseSenderBlock) {
        rnCallback(["A greeting from swift"])
    }
    
    @objc
    func dismissViewController (_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = RNViewManager.sharedInstance.rootView {
                let reactNativeVC: UIViewController? = view.reactViewController()
                reactNativeVC?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc
    func exitPaymentsheet(_ rnMessage: String) {
        var response: String?
        var error: NSError?
        let status = rnMessage.lowercased()
        if (status == "success" || status == "canceled") {
            response = status
        }
        else {
            error = NSError(domain: rnMessage, code: 0)
        }
        RNViewManager.sharedInstance.responseHandler?.didReceiveResponse(response: response, error: error)
    }
    
    @objc
    func exitCardForm(_ rnMessage: String) {
        var response: String?
        var error: NSError?
        let status = rnMessage.lowercased()
        if (status == "success" || status == "canceled") {
            response = status
        }
        else {
            error = NSError(domain: rnMessage, code: 0)
        }
        RNViewManager.sharedInstance.responseHandler?.didReceiveResponse(response: response, error: error)
    }
    
    @objc
    func launchApplePay (_ rnMessage: String, _ rnCallback: @escaping RCTResponseSenderBlock) {
        applePayPaymentHandler.startPayment(rnMessage: rnMessage, rnCallback: rnCallback)
    }
    
#if canImport(Braintree)
    @objc
    func launchPayPal (_ rnMessage: String, _ rnCallback: @escaping RCTResponseSenderBlock) {
        let payPalPaymentHandler = PayPalHandler(rnMessage: rnMessage, rnCallback: rnCallback)
        payPalPaymentHandler.startPayment()
    }
#endif
    
    @objc
    func launchKount (_ rnMessage: String, _ rnCallback: @escaping RCTResponseSenderBlock) {
        
        DispatchQueue.main.async {
            if let kDataCollectorClass = NSClassFromString("KDataCollector") {
                let dict = rnMessage.toJSON() as! [String:Any]
                
                let merchantId = dict["merchantId"]!
                let sessionId = dict["sessionId"]!
                
                kDataCollectorClass.shared().debug = true
                kDataCollectorClass.shared().merchantID = Int(merchantId as! String)!
                kDataCollectorClass.shared().locationCollectorConfig = KLocationCollectorConfig.requestPermission
                kDataCollectorClass.shared().environment = KEnvironment.test
                let analyticsData = true
                KountAnalyticsViewController().setEnvironmentForAnalytics(kDataCollectorClass.shared().environment)
                KountAnalyticsViewController().collect(sessionId as! String, analyticsSwitch: analyticsData) {
                    (sessionID, success, error) in
                    if (success) {
                        print("Collection Successful")
                        print(KountAnalyticsViewController.getKDataCollectionStatus() as Any)
                    }
                    else {
                        if((error) != nil) {
                            print("Collection failed with error",error?.localizedDescription as Any)
                            print(KountAnalyticsViewController.getKDataCollectionError() as Any)
                        }
                        else {
                            print("Collection failed without error")
                        }
                    }
                }
                rnCallback([true])
            }
            else {
                rnCallback([false])
            }
            
        }
    }
    
}
