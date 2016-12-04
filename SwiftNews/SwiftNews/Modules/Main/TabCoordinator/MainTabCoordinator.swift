//
//  MainTabCoordinator.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/4/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class MainTabCoordinator: TabCoordinator {
  var rootController: CustomNavigationController
  var customTabBarItem = TabBarItem(builder: TabBarItemBuilder { builder in
    builder.icon = "latest_news"
    builder.type = .normal
    builder.backgroundColor = UIColor.white
    builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
    builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
  })

  init() {
    let homeVC = ViewController()
    homeVC.title = "Latest news"
    self.rootController = CustomNavigationController(rootViewController: homeVC)
    self.rootController.customTabBarItem = self.customTabBarItem
  }
}
