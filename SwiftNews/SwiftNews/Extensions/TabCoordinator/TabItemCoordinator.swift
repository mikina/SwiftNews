//
//  TabItemCoordinator.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/4/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class TabItemCoordinator: CustomTabBar {
  var rootController: UIViewController
  var customTabBarItem: TabBarItem?

  init<T: TabCoordinator>(tabCoordinator: T) {
    self.rootController = tabCoordinator.rootController
    self.customTabBarItem = tabCoordinator.customTabBarItem
  }
}

func deGenericize<T: TabCoordinator>(coordinator: T) -> TabItemCoordinator {
  return TabItemCoordinator(tabCoordinator: coordinator)
}
