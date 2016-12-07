//
//  AppCoordinator.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/3/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class AppCoordinator {
  var tabBarController: CustomTabBarController
  var tabs: [TabItemCoordinator] = [
    deGenericize(coordinator: LatestNewsTabCoordinator()),
    deGenericize(coordinator: CategoriesTabCoordinator()),
    deGenericize(coordinator: LiveNewsTabCoordinator()),
    deGenericize(coordinator: FeaturedTabCoordinator()),
    deGenericize(coordinator: FavoritesTabCoordinator())
  ]

  init(tabBarController: CustomTabBarController) {
    self.tabBarController = tabBarController
  }

  func start() {
    self.tabBarController.viewControllers = self.tabs.map { (coordinator) -> CustomTabBar in
      return coordinator
    }
  }
}
