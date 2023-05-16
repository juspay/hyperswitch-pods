//
//  RNViewManager.swift
//  hyperswitch
//
//  Created by Shivam Shashank on 09/11/22.
//

import Foundation
import React

protocol RNResponseHandler {
    func didReceiveResponse(response: String?, error: Error?) -> Void
}

class RNViewManager: NSObject {
    
    var rootView: RCTRootView?
    var responseHandler: RNResponseHandler?
    
    lazy var bridge: RCTBridge = {
        RCTBridge.init(delegate: self, launchOptions: nil)
    }()
    
    static let sharedInstance = RNViewManager()
    
    func viewForModule(_ moduleName: String, initialProperties: [String : Any]?) -> RCTRootView {
        let rootView: RCTRootView = RCTRootView(
            bridge: bridge,
            moduleName: moduleName,
            initialProperties: initialProperties)
        self.rootView = rootView
        return rootView
    }
}

extension RNViewManager: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        let plistPath = Bundle(for: RNViewManager.self).path(forResource: "Codepush", ofType: "plist")!
        let plistData = try! Data(contentsOf: URL(fileURLWithPath: plistPath))
        let plistDictionary = try! PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as! [String: String]
        
        CodePush.overrideAppVersion(plistDictionary["HyperVersion"])
        CodePush.setDeploymentKey(plistDictionary["CodePushDeploymentKey"])
        
        return CodePush.bundleURL(
            forResource: "hyperswitch",
            withExtension: "bundle",
            subdirectory: "/Frameworks/hyperswitch.framework"
        )
    }
}
