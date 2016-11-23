//
//  CustomTabBarController.swift
//  SwiftNews
//
//  Created by Mike Mikina on 10/31/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class CustomTabBarController: UIViewController, TabBarItemDelegate {

  var tabBarContainerView: TabBarContainerView?
  var tabBarView: TabBarView?
  var activeViewController: UIViewController?
  var viewControllers: [CustomTabBar] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    self.setupView()
    self.tabBarSelected(position: 0)
  }

  func setupView() {
    self.tabBarContainerView = TabBarContainerView(parentView: self.view)
    self.tabBarView = TabBarView(parentView: self.view, viewControllers: self.viewControllers)
    self.tabBarView?.delegate = self
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

  func tabBarSelected(position: Int) {
    if(position <= self.viewControllers.count && !self.viewControllers.isEmpty) {
      if let vc = self.viewControllers[position] as? UIViewController {
        self.checkForActiveElement(viewController: vc)
        self.prepareForShowViewController(viewController: vc)
        self.tabBarView?.setSelectedTab(index: position)
      }
    }
  }

  func prepareForShowViewController(viewController: UIViewController) {
    if(viewController != self.activeViewController) {
      self.showViewController(viewController: viewController)
    }
  }

  func checkForActiveElement(viewController: UIViewController) {
    if let nav = self.activeViewController as? UINavigationController,
      nav == viewController {
      nav.popToRootViewController(animated: true)
    }
  }
}
