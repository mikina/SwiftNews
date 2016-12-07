//
//  LiveNewsTabCoordinator.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/5/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class LiveNewsTabCoordinator: TabCoordinator {
  var rootController: CustomNavigationController
  var customTabBarItem = TabBarItem(builder: TabBarItemBuilder { builder in
    builder.icon = "live_feed"
    builder.type = .spike
    builder.backgroundColor = UIColor("#F90038")
    builder.iconColor = UIColor(Constants.TabBar.SpikeButtonColor)
    builder.selectedIconColor = UIColor(Constants.TabBar.SpikeSelectedButtonColor)
  })

  init() {
    let homeVC = ViewController()
    homeVC.title = "Live feed"
    self.rootController = CustomNavigationController(rootViewController: homeVC)
    self.rootController.customTabBarItem = self.customTabBarItem
  }
}
