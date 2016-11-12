//
//  CustomTabBarControllerSpec.swift
//  SwiftNews
//
//  Created by Mike Mikina on 11/1/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import SwiftNews

class CustomTabBarControllerSpec: QuickSpec {
  override func spec() {
    describe("default initialization") {
      var sut: CustomTabBarController!
      
      context("tab bar") {
        beforeEach() {
          sut = CustomTabBarController()
          _ = sut.view
        }

        afterEach {
          sut = nil
        }

        it("should have tab bar controller view") {
          expect(sut.tabBarContainerView).toNot(beNil())
        }

        it("should have tab bar controller view as a subview") {
          expect(sut.view.subviews.count).toNot(equal(0))
          expect(sut.view.subviews[0]).to(beAKindOf(TabBarContainerView.self))
        }

        it("should have white tab bar controller view") {
          expect(sut.tabBarContainerView?.backgroundColor).to(equal(UIColor.white))
        }
      }
    }
    
    describe("to tab bar") {
      var sut: CustomTabBarController!
      
      context("add view controller") {
        beforeEach() {
          sut = CustomTabBarController()
          _ = sut.view
          
          let vc = ViewController()
          sut.showViewController(viewController: vc)
        }

        afterEach {
          sut = nil
        }
        
        it("should have subviews") {
          expect(sut.tabBarContainerView?.subviews.count).toNot(equal(0))
        }
        
        it("should have child views") {
          expect(sut.childViewControllers.count).toNot(equal(0))
        }
      }
      
      context("add two view controllers") {
        beforeEach() {
          sut = CustomTabBarController()
          _ = sut.view
          
          let vc = ViewController()
          sut.showViewController(viewController: vc)
          let additional = UIViewController()
          sut.showViewController(viewController: additional)
        }
        
        afterEach {
          sut = nil
        }
        
        it("should have one child view") {
          expect(sut.childViewControllers.count).to(equal(1))
        }
      }
      
      context("add three CustomTabBar items") {
        beforeEach() {
          sut = CustomTabBarController()
          _ = sut.view
          
          let vc1 = ViewController()
          let home = TabBarItemBuilder { builder in
            builder.icon = "home"
            builder.type = .normal
            builder.backgroundColor = UIColor.white
            builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
            builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
          }
          vc1.customTabBarItem = TabBarItem(builder: home)
          
          let vc2 = ViewController()
          let latest = TabBarItemBuilder { builder in
            builder.icon = "latest"
            builder.type = .normal
            builder.backgroundColor = UIColor.white
            builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
            builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
          }
          vc2.customTabBarItem = TabBarItem(builder: latest)
          
          let vc3 = ViewController()
          let settings = TabBarItemBuilder { builder in
            builder.icon = "settings"
            builder.type = .normal
            builder.backgroundColor = UIColor.white
            builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
            builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
          }
          vc3.customTabBarItem = TabBarItem(builder: settings)
          
          sut.viewControllers = [vc1, vc2, vc3]
        }
        
        afterEach {
          sut = nil
        }
        
        it("should have one child view") {
          expect(sut.viewControllers.count).to(equal(3))
        }
      }
    }
    
    describe("tab bar have 3 items") {
      var sut: CustomTabBarController!
      
      beforeEach() {
        sut = CustomTabBarController()
        
        let vc1 = ViewController()
        vc1.title = "home"
        let home = TabBarItemBuilder { builder in
          builder.icon = "home"
          builder.type = .normal
          builder.backgroundColor = UIColor.white
          builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
          builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
        }
        vc1.customTabBarItem = TabBarItem(builder: home)
        
        let vc2 = ViewController()
        vc2.title = "latest"
        let latest = TabBarItemBuilder { builder in
          builder.icon = "latest"
          builder.type = .normal
          builder.backgroundColor = UIColor.white
          builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
          builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
        }
        vc2.customTabBarItem = TabBarItem(builder: latest)
        
        let vc3 = ViewController()
        vc3.title = "settings"
        let settings = TabBarItemBuilder { builder in
          builder.icon = "settings"
          builder.type = .normal
          builder.backgroundColor = UIColor.white
          builder.iconColor = UIColor(Constants.TabBar.DefaultButtonColor)
          builder.selectedIconColor = UIColor(Constants.TabBar.DefaultSelectedButtonColor)
        }
        vc3.customTabBarItem = TabBarItem(builder: settings)
        
        sut.viewControllers = [vc1, vc2, vc3]
        _ = sut.view
      }
      
      afterEach {
        sut = nil
      }
      
      context("without action, first item should be selected") {
        it("active view controller should have title home") {
          expect(sut.activeViewController?.title).to(equal("home"))
        }
      }
      
      context("if second item is selected") {
        it("active view controller should have title latest") {
          sut.tabBarSelected(position: 1)
          expect(sut.activeViewController?.title).to(equal("latest"))
        }
      }
    }
  }
}
