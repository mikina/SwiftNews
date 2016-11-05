//
//  TabBarView.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/4/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit
import SnapKit

class TabBarView: UIView {
  var parentView: UIView?
  var heightConstraint: Constraint? = nil
  var viewControllers: [CustomTabBar] = []

  var height: Int = Constants.TabBar.Height {
    didSet {
      self.setViewHeight(height: height)
    }
  }

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
  }

  func setupView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = UIColor.red

    if let parentView = self.parentView {
      parentView.addSubview(self)

      self.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(parentView)
        make.right.equalTo(parentView)
        make.bottom.equalTo(parentView)
        self.heightConstraint = make.height.equalTo(self.height).constraint
      }
    }
  }

  func setViewHeight(height: Int) {
    self.heightConstraint?.update(offset: height)
  }
}
