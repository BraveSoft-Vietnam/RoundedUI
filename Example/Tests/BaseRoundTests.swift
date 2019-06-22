// https://github.com/Quick/Quick

import Quick
import Nimble
import RoundedUI

class RoundedExtensionSpec: QuickSpec {
    override func spec() {
        var view: UIView!
        beforeEach {
            view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 44))
        }
        describe("setting") {
            context("rounded", closure: {
                it("borderWidth work") {
                    view.borderWidth = 2
                    expect(view.layer.borderWidth) == 2
                }
                it("borderColor work") {
                    view.borderColor = UIColor.gray
                    expect(view.layer.borderColor) == UIColor.gray.cgColor
                }
                it("cornerRadius work") {
                    view.cornerRadius = 12
                    expect(view.layer.cornerRadius) == 12
                }
                it("isCircle work", closure: {
                    view.isCircle = true
                    expect(view.layer.cornerRadius) == (44/2)
                })
            })
            
            context("shadow", closure: {
                it("shadowColor work") {
                    view.shadowColor = UIColor.green
                    expect(view.layer.shadowColor) == UIColor.green.cgColor
                }
                it("shadowRadius work") {
                    view.shadowRadius = 5
                    expect(view.layer.shadowRadius) == 5
                }
                it("shadowOffset work", closure: {
                    let shadowOffset: CGSize = CGSize(width: 3, height: 3)
                    view.shadowOffset = shadowOffset
                    expect(view.layer.shadowOffset) == shadowOffset
                })
                it("shadowOpacity work", closure: {
                    view.shadowOpacity = 0.5
                    expect(view.layer.shadowOpacity) == 0.5
                })
            })
        }
    }
}

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
            })
        }
    }
}
