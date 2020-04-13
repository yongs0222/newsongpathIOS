//
//  AppDelegate.swift
//  newsongtime
//
//  Created by Cherish Park on 12/23/19.
//  Copyright © 2019 Newsong church. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateInitialViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        if #available(iOS 10.0, *) {
            let authOptions : UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_,_ in })
            
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            // For iOS 10 data message (sent via FCM)
            Messaging.messaging().delegate = self
        }
        
        application.registerForRemoteNotifications()
        
        return true
    }
   
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    
}

extension AppDelegate : MessagingDelegate {
    // Receive data message on iOS 10 devices.
    func applicationReceivedRemoteMessage(_ remoteMessage: MessagingRemoteMessage) {
        print("%@", remoteMessage.appData)
    }
}


//
//func extractYoutubeIdFromLink(link: String) -> String? {
//    let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
//    guard let regExp = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
//        return nil
//    }
//    let nsLink = link as NSString
//    let options = NSRegularExpression.MatchingOptions(rawValue: 0)
//    let range = NSRange(location: 0, length: nsLink.length)
//    let matches = regExp.matches(in: link as String, options:options, range:range)
//    if let firstMatch = matches.first {
//        return nsLink.substring(with: firstMatch.range)
//    }
//    return nil
//}
