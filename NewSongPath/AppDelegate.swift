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
        //        let userInfo = notification.request.content.userInfo
        // Print message ID.
        //        print("Message ID: \(userInfo["gcm.message_id"]!)")
        
        // Print full message.
        //        print("%@", userInfo)
        
    }
    
}

extension AppDelegate : MessagingDelegate {
    // Receive data message on iOS 10 devices.
    func applicationReceivedRemoteMessage(_ remoteMessage: MessagingRemoteMessage) {
        print("%@", remoteMessage.appData)
    }
}
