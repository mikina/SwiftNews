//
//  TabBarContainerView.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/2/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit
import SnapKit

class TabBarContainerView: UIView {
  var parentView: UIView?

  override init (frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  convenience init(parentView: UIView) {
    self.init()
    self.parentView = parentView
    self.setupView()
  }

  func setupView() {
    self.backgroundColor = UIColor.white
    self.translatesAutoresizingMaskIntoConstraints = false
    if let parentView = self.parentView {
      parentView.addSubview(self)
      self.snp.makeConstraints { (make) -> Void in
        make.edges.equalTo(parentView)
      }
    }
  }
}
