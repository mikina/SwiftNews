//
//  TabBarItemBuilder.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/10/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class TabBarItemBuilder {
  var icon: String?
  var type: TabBarItemType?
  var backgroundColor: UIColor?
  var iconColor: UIColor?
  var selectedIconColor: UIColor?

  typealias BuilderClosure = (TabBarItemBuilder) -> ()

  init(buildClosure: BuilderClosure) {
    buildClosure(self)
  }
}
