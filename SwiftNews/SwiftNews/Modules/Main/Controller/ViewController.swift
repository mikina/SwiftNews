//
//  ViewController.swift
//  SwiftNews
//
//  Created by Mike Mikina on 10/22/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomTabBar {
  var customTabBarItem: TabBarItem?
  @IBOutlet weak var testLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.testLabel.text = self.title
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
