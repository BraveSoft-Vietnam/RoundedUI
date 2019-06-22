//
//  AdvanceRoundTests.swift
//  RoundedUI_Tests
//
//  Created by Hien Pham on 6/22/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RoundedUI

class RoundedShapeLayerSpec: QuickSpec {
    override func spec() {
        describe("setting") {
            context("rounded", closure: {
                var layer: RoundedShapeLayer!
                beforeEach {
                    layer = RoundedShapeLayer()
                    layer.frame = CGRect(x: 0, y: 0, width: 280, height: 44)
                }
                
                it("roundTopLeft disable work") {
                    // Set corner radius.
                    let cornerRadius: CGFloat = 10
                    layer.shapeCornerRadius = cornerRadius
                    
                    layer.roundTopLeft = false
                    
                    var corners: UIRectCorner = .allCorners
                    corners.remove(UIRectCorner.topLeft)
                    let expectedPath: UIBezierPath = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                    let actualPath: UIBezierPath = UIBezierPath(cgPath: layer.path!)
                    
                    expect(actualPath) == expectedPath
                }
                it("roundTopRight disable work") {
                    // Set corner radius.
                    let cornerRadius: CGFloat = 10
                    layer.shapeCornerRadius = cornerRadius
                    
                    layer.roundTopRight = false
                    
                    var corners: UIRectCorner = .allCorners
                    corners.remove(UIRectCorner.topRight)
                    let expectedPath: UIBezierPath = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                    let actualPath: UIBezierPath = UIBezierPath(cgPath: layer.path!)
                    
                    expect(actualPath) == expectedPath
                }
                it("roundBottomLeft disable work") {
                    // Set corner radius.
                    let cornerRadius: CGFloat = 10
                    layer.shapeCornerRadius = cornerRadius
                    
                    layer.roundBottomLeft = false
                    
                    var corners: UIRectCorner = .allCorners
                    corners.remove(UIRectCorner.bottomLeft)
                    let expectedPath: UIBezierPath = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                    let actualPath: UIBezierPath = UIBezierPath(cgPath: layer.path!)
                    
                    expect(actualPath) == expectedPath
                }
                it("roundBottomRight disable work") {
                    // Set corner radius.
                    let cornerRadius: CGFloat = 10
                    layer.shapeCornerRadius = cornerRadius
                    
                    layer.roundBottomRight = false
                    
                    var corners: UIRectCorner = .allCorners
                    corners.remove(UIRectCorner.bottomRight)
                    let expectedPath: UIBezierPath = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                    let actualPath: UIBezierPath = UIBezierPath(cgPath: layer.path!)
                    
                    expect(actualPath) == expectedPath
                }
                it("round all corners work") {
                    // Set corner radius.
                    let cornerRadius: CGFloat = 10
                    layer.shapeCornerRadius = cornerRadius
                    
                    let expectedPath: UIBezierPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: cornerRadius)
                    let actualPath: UIBezierPath = UIBezierPath(cgPath: layer.path!)
                    
                    expect(actualPath) == expectedPath
                }
                it("disable roundTopRight and roundBottomLeft work") {
                    // Set corner radius.
                    let cornerRadius: CGFloat = 10
                    layer.shapeCornerRadius = cornerRadius
                    
                    layer.roundTopRight = false
                    layer.roundBottomLeft = false
                    
                    var corners: UIRectCorner = .allCorners
                    corners.remove(UIRectCorner.topRight)
                    corners.remove(UIRectCorner.bottomLeft)
                    let expectedPath: UIBezierPath = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners:corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                    let actualPath: UIBezierPath = UIBezierPath(cgPath: layer.path!)
                    
                    expect(actualPath) == expectedPath
                }
            })
        }
    }
}
