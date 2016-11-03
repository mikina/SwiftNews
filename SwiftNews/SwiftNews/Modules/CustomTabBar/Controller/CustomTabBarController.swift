//
//  CustomTabBarController.swift
//  SwiftNews
//
//  Created by Mike Mikina on 10/31/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class CustomTabBarController: UIViewController {

  var tabBarContainerView: TabBarContainerView?
  var activeViewController: UIViewController?

  override func viewDidLoad() {
    super.viewDidLoad()

    self.setupView()
  }

  func setupView() {
    self.tabBarContainerView = TabBarContainerView(parentView: self.view)
  }

  func showViewController(viewController: UIViewController) {
    if(self.activeViewController != nil) {
      self.removeActiveViewController()
    }

    self.addChildViewController(viewController)
    if let container = self.tabBarContainerView {
      viewController.view.frame = container.bounds
      container.addSubview(viewController.view)
    }
    self.activeViewController = viewController
    viewController.didMove(toParentViewController: self)
  }

  func removeActiveViewController() {
    self.activeViewController?.willMove(toParentViewController: nil)
    self.activeViewController?.view.removeFromSuperview()
    self.activeViewController?.removeFromParentViewController()
  }
}
