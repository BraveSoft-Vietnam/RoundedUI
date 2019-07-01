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
                    expect(view.borderWidth) == 2
                }
                it("borderColor work") {
                    view.borderColor = nil
                    expect(view.borderColor).to(beNil())
                    
                    let borderColor: UIColor = .gray
                    view.borderColor = borderColor
                    expect(view.layer.borderColor) == borderColor.cgColor
                    expect(view.borderColor) == borderColor
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
                    view.shadowColor = nil
                    expect(view.shadowColor).to(beNil())

                    let shadowColor: UIColor = .green
                    view.shadowColor = shadowColor
                    expect(view.layer.shadowColor) == shadowColor.cgColor
                    expect(view.shadowColor) == shadowColor
                }
                it("shadowRadius work") {
                    view.shadowRadius = 5
                    expect(view.layer.shadowRadius) == 5
                    expect(view.shadowRadius) == 5
                }
                it("shadowOffset work", closure: {
                    let shadowOffset: CGSize = CGSize(width: 3, height: 3)
                    view.shadowOffset = shadowOffset
                    expect(view.layer.shadowOffset) == shadowOffset
                    expect(view.shadowOffset) == shadowOffset
                })
                it("shadowOpacity work", closure: {
                    view.shadowOpacity = 0.5
                    expect(view.layer.shadowOpacity) == 0.5
                    expect(view.shadowOpacity) == 0.5
                })
            })
        }
    }
}
