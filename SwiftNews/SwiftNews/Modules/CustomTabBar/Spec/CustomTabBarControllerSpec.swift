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
      context("tab bar") {
        it("should have tab bar controller view") {
          let sut = CustomTabBarController()
          _ = sut.view

          expect(sut.tabBarControllerView).toNot(beNil())
        }

        it("should have tab bar controller view as a subview") {
          let sut = CustomTabBarController()
          _ = sut.view
          
          expect(sut.view.subviews.count).toNot(equal(0))
          expect(sut.view.subviews[0]).to(beAKindOf(TabBarContainerView.self))
        }
        
        it("should have white tab bar controller view") {
          let sut = CustomTabBarController()
          _ = sut.view
          
          expect(sut.tabBarControllerView?.backgroundColor).to(equal(UIColor.white))
        }
      }
    }
  }
}
