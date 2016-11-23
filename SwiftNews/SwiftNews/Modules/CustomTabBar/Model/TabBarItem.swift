//
//  TabBarItem.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/3/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class TabBarItem {
  let icon: String
  let type: TabBarItemType
  let backgroundColor: UIColor
  let iconColor: UIColor
  let selectedIconColor: UIColor

  init?(builder: TabBarItemBuilder) {
    guard let icon = builder.icon,
      let type = builder.type,
      let backgroundColor = builder.backgroundColor,
      let iconColor = builder.iconColor,
      let selectedIconColor = builder.selectedIconColor else {
        return nil
    }

    self.icon = icon
    self.type = type
    self.backgroundColor = backgroundColor
    self.iconColor = iconColor
    self.selectedIconColor = selectedIconColor
  }
}
