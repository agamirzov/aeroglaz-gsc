//
//  AppDelegate.swift
//  DroneMap
//
//  Created by Evgeny Agamirzov on 12/5/18.
//  Copyright © 2018 Evgeny Agamirzov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {
    internal var window: UIWindow?
    private var env: Environment?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        env = Environment()
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = env!.rootViewController()
        window!.makeKeyAndVisible()
        env!.connectionService().start()
        return true
    }
}

