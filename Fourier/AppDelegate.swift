//
//  AppDelegate.swift
//  Fourier
//
//  Created by Tanay Nistala on 6/15/20.
//  Copyright © 2020 Tanay Nistala. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UISwitch.appearance().onTintColor = UIColor(named: "\(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo")")
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UserDefaults.standard.bool(forKey: "reduce_colors") ? UIColor.systemGray : UIColor(named: UserDefaults.standard.string(forKey: "app_tint") ?? "indigo") ?? UIColor.systemIndigo,
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 24))
        
//        let appearance = UINavigationBarAppearance()
//        let attrs: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(named: "\(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo")") ?? UIColor.systemindigo]
//        appearance.largeTitleTextAttributes = attrs
//        UINavigationBar.appearance().standardAppearance = appearance
        
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
