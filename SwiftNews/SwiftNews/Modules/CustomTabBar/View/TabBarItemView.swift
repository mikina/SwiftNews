//
//  TabBarItemView.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/6/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class TabBarItemView: UIView, CustomTabBar {

  var customTabBarItem: TabBarItem?
  var position: Int?
  var delegate: TabBarItemDelegate?
  var button: UIButton?
  var isSelected: Bool {
    get {
      return self.isSelected
    }
    set(item) {
      if item {
        self.button?.tintColor = self.customTabBarItem?.selectedIconColor
      } else {
        self.button?.tintColor = self.customTabBarItem?.iconColor
      }
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  convenience init(customTabBarItem: TabBarItem, position: Int) {
    self.init()
    self.customTabBarItem = customTabBarItem
    self.position = position

    self.setupButton()
  }

  func setupButton() {
    self.button = UIButton()

    guard let item = self.customTabBarItem, let button = self.button else {
      return
    }

    button.addTarget(self, action: #selector(TabBarItemView.clickButton), for: .touchUpInside)
    self.addSubview(button)
    button.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(self)
    }

    button.isUserInteractionEnabled = true
    let icon = UIImage(named: item.icon)?.withRenderingMode(.alwaysTemplate)
    button.setImage(icon, for: UIControlState())
    button.tintColor = UIColor(Constants.TabBar.DefaultButtonColor)

    self.backgroundColor = item.backgroundColor
    self.isSelected = false
  }

  func clickButton(sender: UIButton) {
    if let number = self.position {
      self.delegate?.tabBarSelected(position: number)
    }
  }
}
