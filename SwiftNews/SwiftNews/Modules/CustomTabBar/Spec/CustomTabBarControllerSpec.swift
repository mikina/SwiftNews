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
          expect(sut.tabBarControllerView).toNot(beNil())
        }

        it("should have tab bar controller view as a subview") {
          expect(sut.view.subviews.count).toNot(equal(0))
          expect(sut.view.subviews[0]).to(beAKindOf(TabBarContainerView.self))
        }

        it("should have white tab bar controller view") {
          expect(sut.tabBarControllerView?.backgroundColor).to(equal(UIColor.white))
        }
      }
    }
  }
}
