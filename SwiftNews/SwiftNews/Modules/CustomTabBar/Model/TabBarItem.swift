//
//  TabBarItem.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/3/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

enum TabBarItemType {
  case normal
  case spike
}

class TabBarItem {
  let icon: String
  let type: TabBarItemType
  let backgroundColor: UIColor

  init(icon: String, type: TabBarItemType, backgroundColor: UIColor) {
    self.icon = icon
    self.type = type
    self.backgroundColor = backgroundColor
  }
}
