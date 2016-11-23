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

  @IBAction func goAction(_ sender: Any) {
    let vc = ViewController()
    vc.title = "Hello again!"
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
