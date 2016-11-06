//
//  TabBarButtonsView.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/5/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class TabBarButtonsView: UIView {
  var parentView: UIView?
  var viewControllers: [CustomTabBar] = []
  var tabBarItemViews: [TabBarItemView] = []

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  convenience init(parentView: UIView, viewControllers: [CustomTabBar]) {
    self.init()
    self.viewControllers = viewControllers
    self.parentView = parentView

    self.setupView()
    self.setupButtons()
  }

  func setupView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    if let parentView = self.parentView {
      parentView.addSubview(self)
      self.snp.makeConstraints { (make) -> Void in
        make.edges.equalTo(parentView).inset(UIEdgeInsets(
          top: CGFloat(Constants.TabBar.TopBorderHeight),
          left: 0,
          bottom: 0,
          right: 0))
      }
    }
  }

  func setupButtons() {
    var i = 0

    for viewController in self.viewControllers {
      guard let customTabBar = viewController.customTabBarItem else {
        continue
      }

      let item = TabBarItemView(customTabBarItem: customTabBar, position: i)
      item.translatesAutoresizingMaskIntoConstraints = false
      item.customTabBarItem = customTabBar
      item.position = i
      self.addSubview(item)
      self.tabBarItemViews.append(item)
      i += 1
    }

    self.layoutButtons()
  }

  func layoutButtons() {
    if let item = self.tabBarItemViews.first, self.tabBarItemViews.count == 1 {
      item.snp.makeConstraints({ (make) -> Void in
        make.edges.equalTo(self)
      })
    }
  }
}
