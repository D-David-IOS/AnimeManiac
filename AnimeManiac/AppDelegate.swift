//
//  AppDelegate.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit
import IQKeyboardManagerSwift
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

