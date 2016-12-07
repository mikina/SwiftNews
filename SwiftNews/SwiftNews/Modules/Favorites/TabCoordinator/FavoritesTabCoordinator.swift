//
//  FavoritesTabCoordinator.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/6/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class FavoritesTabCoordinator: TabCoordinator {
  var rootController: CustomNavigationController
  var customTabBarItem = TabBarItem(builder: TabBarItemBuilder { builder in
    builder.icon = "favorites"
    builder.type = .normal
    builder.backgroundColor = UIColor.white
    builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
    builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
  })

  init() {
    let homeVC = ViewController()
    homeVC.title = "Favorites"
    self.rootController = CustomNavigationController(rootViewController: homeVC)
    self.rootController.customTabBarItem = self.customTabBarItem
  }
}
