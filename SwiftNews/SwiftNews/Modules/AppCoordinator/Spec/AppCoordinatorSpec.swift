//
//  AppCoordinatorSpec.swift
//  SwiftNews
//
//  Created by Mike Mikina on 12/3/16.
//  Copyright © 2016 SwiftCookies.com. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import SwiftNews

class AppCoordinatorSpec: QuickSpec {
  override func spec() {
    describe("default initialization") {
      var sut: AppCoordinator!
      
      context("appcoordinator") {
        beforeEach() {
          let mainVC = CustomTabBarController()
          
          sut = AppCoordinator(tabBarController: mainVC)
          sut.start()
          _ = mainVC.view
        }
        
        afterEach {
          sut = nil
        }
        
        it("should have tab bar controller") {
          expect(sut.tabBarController).notTo(beNil())
          expect(sut.tabBarController).to(beAKindOf(CustomTabBarController.self))
        }
        
        it("should have two tab") {
          expect(sut.tabs.count).to(equal(2))
        }

        it("should have tab bar with two view controller") {
          expect(sut.tabBarController.viewControllers.count).to(equal(2))
        }

        context("without action, first item should be selected") {
          it("active view controller should have title Latest news") {
            expect(sut.tabBarController.activeViewController?.title).to(equal("Latest news"))
          }
        }

        context("if second item is selected") {
          it("active view controller should have title Categories") {
            sut.tabBarController.tabBarSelected(position: 1)
            expect(sut.tabBarController.activeViewController?.title).to(equal("Categories"))
          }
        }
      }
    }
  }
}
