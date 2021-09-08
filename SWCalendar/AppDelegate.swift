//
//  AppDelegate.swift
//  SWCalendar
//
//  Created by 신상우 on 2021/08/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = CalendarViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}
