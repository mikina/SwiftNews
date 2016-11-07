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
    if self.tabBarItemViews.isEmpty {
      return
    }

    self.pinTopAndBottom()
    self.pinSides()
    self.pinEdges()
    self.applySizes()
    self.applySizesForSpikes()
  }

  func pinTopAndBottom() {
    for element in self.tabBarItemViews {
      element.snp.makeConstraints({ (make) -> Void in
        if element.customTabBarItem?.type != .spike {
          make.top.equalTo(self)
        }

        make.bottom.equalTo(self)
      })
    }
  }

  func pinSides() {
    var previousElement: TabBarItemView?
    for element in self.tabBarItemViews {
      previousElement?.snp.makeConstraints({ (make) -> Void in
        make.trailing.equalTo(element.snp.leading)
      })
      previousElement = element
    }
  }

  func pinEdges() {
    let firstItem = self.tabBarItemViews.first
    firstItem?.snp.makeConstraints({ (make) -> Void in
      make.left.equalTo(self)
    })

    let lastItem = self.tabBarItemViews.last
    lastItem?.snp.makeConstraints({ (make) -> Void in
      make.right.equalTo(self)
    })
  }

  func applySizes() {
    var previousElement: TabBarItemView?
    for element in self.tabBarItemViews where element.customTabBarItem?.type == .normal {
      previousElement?.snp.makeConstraints({ (make) -> Void in
        make.width.equalTo(element.snp.width)
        make.height.equalTo(element.snp.height)
      })
      previousElement = element
    }
  }

  func applySizesForSpikes() {
    let normalElement: TabBarItemView? = self.tabBarItemViews.first(where: {$0.customTabBarItem?.type == .normal})

    guard let normal = normalElement else {
      return
    }

    for element in self.tabBarItemViews where element.customTabBarItem?.type == .spike {
      element.snp.makeConstraints({ (make) -> Void in
        make.width.equalTo(normal.snp.width).multipliedBy(1.2)
        make.height.equalTo(normal.snp.height).multipliedBy(1.2)
      })
    }
  }
}
