//
//  UIColor+DarkerTests.swift
//  RoundedUI_Tests
//
//  Created by Hien Pham on 6/29/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RoundedUI

class UIColorDarkerSpec: QuickSpec {
    override func spec() {
        describe("get") {
            context("color", closure: {
                it("darker should not work with non RGB color") {
                    let color: UIColor = UIColor(patternImage: UIImage())
                    let darker = color.darker()
                    expect(darker).to(beNil())
                }
            })
        }
    }
}
