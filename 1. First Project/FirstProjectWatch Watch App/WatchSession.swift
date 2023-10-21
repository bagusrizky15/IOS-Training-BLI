//
//  WatchSession.swift
//  FirstProjectWatch Watch App
//
//  Created by BBPDEV on 20/10/23.
//

import Foundation
import WatchConnectivity

class WatchSession: NSObject, ObservableObject {
    @Published var receivedData: String = "Empty Data"
    var watchSession: WCSession?
    
    override init() {
        super.init()
        
        watchSession = WCSession.default
        watchSession?.delegate = self
        watchSession?.activate()
    }

}

extension WatchSession: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let data = message["key"] as? String {
            self.receivedData = data
        }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        if let data = applicationContext["key"] as? String {
            receivedData = data
        }
    }
    
}
