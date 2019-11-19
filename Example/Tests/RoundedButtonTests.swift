//
//  RoundedButtonTests.swift
//  RoundedUI_Tests
//
//  Created by Hien Pham on 7/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RoundedUI

class RoundedButtonSpec: QuickSpec {
    override func spec() {
        var button: RoundedButton!
        describe("setting") {
            context("fillColor", closure: {
                beforeEach {
                    button = RoundedButton(frame: CGRect(x: 0, y: 0, width: 280, height: 44))
                }
                
                it("fillColorNormal work", closure: {
                    let color: UIColor = UIColor.red
                    button.fillColorNormal = color
                    expect(button.layer.backgroundColor) == color.cgColor
                })
                it("fillColorHighlighted default will be nil if fillColorNormal not compatible with RGB", closure: {
                    let color: UIColor = UIColor(patternImage: UIImage())
                    button.fillColorNormal = color
                    button.isHighlighted = true
                    expect(button.layer.backgroundColor).to(beNil())
                })
                it("fillColorHighlighted default correct", closure: {
                    let color: UIColor = UIColor.white
                    button.fillColorNormal = color
                    button.isHighlighted = true
                    expect(button.layer.backgroundColor) == #colorLiteral(red: 0.8, green: 0.8000000119, blue: 0.8000000119, alpha: 1).cgColor
                })
                it("fillColorHighlighted work", closure: {
                    let color: UIColor = UIColor.green
                    button.fillColorHighlighted = color
                    button.isHighlighted = true
                    expect(button.layer.backgroundColor) == color.cgColor
                })
                it("fillColorSelected work", closure: {
                    let color: UIColor = UIColor.blue
                    button.fillColorSelected = color
                    button.isSelected = true
                    expect(button.layer.backgroundColor) == color.cgColor
                })
                it("fillColorDisable work", closure: {
                    let color: UIColor = UIColor.yellow
                    button.fillColorDisabled = color
                    button.isEnabled = false
                    expect(button.layer.backgroundColor) == color.cgColor
                })
                
                it("fillColorNormal show when is selected and is highlighted", closure: {
                    let colorNormal: UIColor = UIColor.red
                    let colorHighlighted: UIColor = UIColor.green
                    let colorSelected: UIColor = UIColor.blue
                    button.fillColorNormal = colorNormal
                    button.fillColorHighlighted = colorHighlighted
                    button.fillColorSelected = colorSelected
                    button.isSelected = true
                    button.isHighlighted = true
                    expect(button.layer.backgroundColor) == colorNormal.cgColor
                })
            })
            
            context("borderColor", closure: {
                beforeEach {
                    button = RoundedButton(frame: CGRect(x: 0, y: 0, width: 280, height: 44))
                }
                
                it("borderColorNormal work", closure: {
                    let color: UIColor = UIColor.gray
                    button.borderColorNormal = color
                    expect(button.layer.borderColor) == color.cgColor
                })
                it("borderColorHighlighted work", closure: {
                    let color: UIColor = UIColor.darkGray
                    button.borderColorHighlighted = color
                    button.isHighlighted = true
                    expect(button.layer.borderColor) == color.cgColor
                })
                it("borderColorHighlighted default will be nil if borderColorNormal not compatible with RGB", closure: {
                    let color: UIColor = UIColor(patternImage: UIImage())
                    button.borderColorNormal = color
                    button.isHighlighted = true
                    expect(button.layer.borderColor).to(beNil())
                })
                it("borderColorSelected work", closure: {
                    let color: UIColor = UIColor.black
                    button.borderColorSelected = color
                    button.isSelected = true
                    expect(button.layer.borderColor) == color.cgColor
                })
                it("borderColorDisable work", closure: {
                    let color: UIColor = UIColor.lightGray
                    button.borderColorDisabled = color
                    button.isEnabled = false
                    expect(button.layer.borderColor) == color.cgColor
                })
                it("borderColorNormal show when is selected and is highlighted", closure: {
                    let colorNormal: UIColor = UIColor.red
                    let colorHighlighted: UIColor = UIColor.green
                    let colorSelected: UIColor = UIColor.blue
                    button.borderColorNormal = colorNormal
                    button.borderColorHighlighted = colorHighlighted
                    button.borderColorSelected = colorSelected
                    button.isSelected = true
                    button.isHighlighted = true
                    expect(button.layer.borderColor) == colorNormal.cgColor
                })
            })
            
            context("components", closure: {
                beforeEach {
                    button = RoundedButton(frame: CGRect(x: 0, y: 0, width: 280, height: 44))
                    
                    // Set components
                    var children: Array<UIButton> = Array()
                    let count: Int = 10
                    for _ in 0..<count {
                        let child: UIButton = UIButton()
                        children.append(child)
                        button.addSubview(child)
                    }
                    button.components = children
                }
                
                
                it("components can be highlighted", closure: {
                    button.isHighlighted = true
                    for child: UIButton in button.components {
                        expect(child.isHighlighted) == true
                    }
                })
                it("components can be selected", closure: {
                    button.isSelected = true
                    for child: UIButton in button.components {
                        expect(child.isSelected) == true
                    }
                })
                it("components can be disabled", closure: {
                    button.isEnabled = false
                    for child: UIButton in button.components {
                        expect(child.isEnabled) == false
                    }
                })
                it("components highlight can be disabled", closure: {
                    button.isHighlightedEnabled = false
                    button.isHighlighted = true
                    for child: UIButton in button.components {
                        expect(child.isHighlighted) == false
                    }
                })
                it("components userInteractionEnabled should be disable after set", closure: {
                    for child: UIButton in button.components {
                        expect(child.isUserInteractionEnabled) == false
                    }
                })
                it("components userInteractionEnabled should be restore after enable", closure: {
                    button.components = []
                    for child: UIButton in button.components {
                        expect(child.isUserInteractionEnabled) == true
                    }
                })
            })
        }
    }
}
