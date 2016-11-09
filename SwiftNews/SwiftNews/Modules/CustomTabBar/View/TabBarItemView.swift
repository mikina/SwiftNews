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
    guard let item = self.customTabBarItem else {
      return
    }

    let button = UIButton()
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
  }

  func clickButton(sender: UIButton) {
    if let number = self.position {
      self.delegate?.tabBarSelected(position: number)
    }
  }
}
