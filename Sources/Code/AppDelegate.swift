//
//  AppDelegate.swift
//  Prayer
//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Imperio

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Stored Instance Properties

    var appCoordinator: AppCoordinator?
    var window: UIWindow?


    // MARK: - Application Lifecycle Methods

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // global configurations
        Globals.configureLogger()
        Branding.shared.setupGlobalAppearance()

        // load initial coordinator
        appCoordinator = SettingsCoordinator()
        appCoordinator?.start()

        // set window
        window = appCoordinator?.window

        return true
    }
}

