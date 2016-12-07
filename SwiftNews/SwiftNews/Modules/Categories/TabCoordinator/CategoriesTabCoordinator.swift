//
//  CategoriesTabCoordinator.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/5/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class CategoriesTabCoordinator: TabCoordinator {
  var rootController: ViewController
  var customTabBarItem = TabBarItem(builder: TabBarItemBuilder { builder in
    builder.icon = "categories"
    builder.type = .normal
    builder.backgroundColor = UIColor.white
    builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
    builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
  })

  init() {
    let homeVC = ViewController()
    homeVC.title = "Categories"
    self.rootController = homeVC
    self.rootController.customTabBarItem = self.customTabBarItem
  }
}
