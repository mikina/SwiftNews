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
    let latestNewsItem = TabBarItemBuilder { builder in
      builder.icon = "latest_news"
      builder.type = .normal
      builder.backgroundColor = UIColor.white
      builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
      builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
    }
    latestNews.title = "Latest news"
    let latestNewsNavigation = CustomNavigationController()
    latestNewsNavigation.customTabBarItem = TabBarItem(builder: latestNewsItem)
    latestNewsNavigation.viewControllers = [latestNews]

    let categories = ViewController()
    let categoriesItem = TabBarItemBuilder { builder in
      builder.icon = "categories"
      builder.type = .normal
      builder.backgroundColor = UIColor.white
      builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
      builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
    }
    categories.customTabBarItem = TabBarItem(builder: categoriesItem)
    categories.title = "Categories"

    let liveFeed = ViewController()
    let liveFeedItem = TabBarItemBuilder { builder in
      builder.icon = "live_feed"
      builder.type = .spike
      builder.backgroundColor = UIColor("#F90038")
      builder.iconColor = UIColor(Constants.TabBar.SpikeButtonColor)
      builder.selectedIconColor = UIColor(Constants.TabBar.SpikeSelectedButtonColor)
    }
    liveFeed.customTabBarItem = TabBarItem(builder: liveFeedItem)
    liveFeed.title = "Live feed"

    let featured = ViewController()
    let featuredItem = TabBarItemBuilder { builder in
      builder.icon = "featured"
      builder.type = .normal
      builder.backgroundColor = UIColor.white
      builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
      builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
    }
    featured.customTabBarItem = TabBarItem(builder: featuredItem)
    featured.title = "Featured"

    let favorites = ViewController()
    let favoritesItem = TabBarItemBuilder { builder in
      builder.icon = "favorites"
      builder.type = .normal
      builder.backgroundColor = UIColor.white
      builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
      builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
    }
    favorites.customTabBarItem = TabBarItem(builder: favoritesItem)
    favorites.title = "Favorites"

    mainVC.viewControllers = [latestNewsNavigation, categories, liveFeed, featured, favorites]

    self.window?.rootViewController = mainVC
    self.window?.makeKeyAndVisible()

    Fabric.with([Crashlytics.self])

    return true
  }
}
