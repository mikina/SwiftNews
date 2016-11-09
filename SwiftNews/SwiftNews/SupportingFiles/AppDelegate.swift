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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    self.window = UIWindow(frame: UIScreen.main.bounds)

    let mainVC = CustomTabBarController()

    let latestNews = ViewController()
    latestNews.customTabBarItem = TabBarItem(icon: "latest_news", type: .normal, backgroundColor: UIColor.white)
    latestNews.title = "Latest news"

    let categories = ViewController()
    categories.customTabBarItem = TabBarItem(icon: "categories", type: .normal, backgroundColor: UIColor.white)
    categories.title = "Categories"

    let liveFeed = ViewController()
    liveFeed.customTabBarItem = TabBarItem(icon: "live_feed", type: .spike, backgroundColor: UIColor("#F90038"))
    liveFeed.title = "Live feed"

    let featured = ViewController()
    featured.customTabBarItem = TabBarItem(icon: "featured", type: .normal, backgroundColor: UIColor.white)
    featured.title = "Featured"

    let favorites = ViewController()
    favorites.customTabBarItem = TabBarItem(icon: "favorites", type: .normal, backgroundColor: UIColor.white)
    favorites.title = "Favorites"

    mainVC.viewControllers = [latestNews, categories, liveFeed, featured, favorites]
    self.window?.rootViewController = mainVC
    self.window?.makeKeyAndVisible()

    Fabric.with([Crashlytics.self])

    return true
  }
}
