//
//  AppDelegate.swift
//  kanschool
//
//  Created by 島田淳一 on 2020/03/15.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit
//通知のアラートを出す
import UserNotifications
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 通知の許可を確認するアラートを出す
        let notificationCenter = UNUserNotificationCenter.current()
        // 許可のアラートを表示する
        notificationCenter.requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
            // granted：許可された場合：true, 許可されなかった場合：false
            if error != nil {
                // errorがnilでない場合（エラーが発生した場合）
                return // 処理を中断
            }
            if granted {
                // 許可された場合
                print("許可された")
                let center = UNUserNotificationCenter.current()
                center.delegate = self
            } else {
                // 許可されなかった場合
                print("許可されなかった")
            }
        }

IQKeyboardManager.shared.enable = true




        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

