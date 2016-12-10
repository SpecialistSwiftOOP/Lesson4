//: Playground - noun: a place where people can play

import UIKit

@objc
class Receiver : NSObject {
    
    func processNotification(notification: Notification) {
        print(notification.name.rawValue)
        print(notification.userInfo!)
    }
    
}

let receiver = Receiver()

NotificationCenter.default.addObserver(receiver, selector: #selector(receiver.processNotification(notification:)), name: NSNotification.Name("Data"), object: nil)

NotificationCenter.default.post(name: NSNotification.Name("Data"), object: nil, userInfo: ["type" : 10])


