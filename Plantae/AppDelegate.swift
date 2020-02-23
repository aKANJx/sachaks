//
//  AppDelegate.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let contentView = ContentView()
        window?.rootViewController = UIHostingController(rootView: contentView)
        window?.makeKeyAndVisible()
        return true
    }
}

