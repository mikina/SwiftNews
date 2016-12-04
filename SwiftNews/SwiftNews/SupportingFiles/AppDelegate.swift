//
//  AppDelegate.swift
//  SwiftNews
//
//  Created by Mike Mikina on 10/22/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator: AppCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    self.window = UIWindow(frame: UIScreen.main.bounds)

    let mainVC = CustomTabBarController()

    self.window?.rootViewController = mainVC

    appCoordinator = AppCoordinator(tabBarController: mainVC)
    appCoordinator?.start()

    self.window?.makeKeyAndVisible()

    Fabric.with([Crashlytics.self])

    return true
  }
}
