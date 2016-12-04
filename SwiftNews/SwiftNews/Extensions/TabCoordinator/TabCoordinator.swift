//
//  TabCoordinator.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/4/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

protocol TabCoordinator {
  associatedtype RootType: UIViewController
  var rootController: RootType { get }
  var customTabBarItem: TabBarItem? { get }
}
