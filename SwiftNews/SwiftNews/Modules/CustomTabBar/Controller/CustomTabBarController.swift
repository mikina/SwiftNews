//
//  CustomTabBarController.swift
//  SwiftNews
//
//  Created by Mike Mikina on 10/31/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class CustomTabBarController: UIViewController {

  var tabBarControllerView: UIView?

  override func viewDidLoad() {
    super.viewDidLoad()

    self.setupView()
  }

  func setupView() {
    self.tabBarControllerView = UIView()
  }
}
