//
//  RoundedButton.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/14/19.
//

import UIKit

/**
 Convenient button for easier customize in interface builder. Supporting include: color for every state, round corner, composite button and shadow.
 */
open class RoundedButton: UIButton {
    /**
     Fill color for normal state.
     */
    @IBInspectable dynamic open var fillColorNormal: UIColor = .clear {
        didSet {
            refreshDisplayFillColor()
        }
    }
    /**
     Fill color for highlighted state. Default is fillColorNormal with darker tone if fillColorNormal is compatible with RGB, else is nil.
     */
    @IBInspectable dynamic open var fillColorHighlighted: UIColor? {
        didSet {
            refreshDisplayFillColor()
        }
    }
    /**
     Fill color for selected state. Default is fillColorNormal.
     */
    @IBInspectable dynamic open var fillColorSelected: UIColor? {
        didSet {
            refreshDisplayFillColor()
        }
    }
    /**
     Fill color for disabled state. Default is fillColorNormal.
     */
    @IBInspectable dynamic open var fillColorDisabled: UIColor? {
        didSet {
            refreshDisplayFillColor()
        }
    }
    /**
     Border color for normal state.
     */
    @IBInspectable dynamic open var borderColorNormal: UIColor = .clear {
        didSet {
            refreshDisplayBorderColor()
        }
    }
    /**
     Border color for highlighted state. Default is borderColorNormal with darker tone if borderColorNormal is compatible with RGB, else is nil.
     */
    @IBInspectable dynamic open var borderColorHighlighted: UIColor? {
        didSet {
            refreshDisplayBorderColor()
        }
    }
    /**
     Border color for selected state. Default is borderColorNormal.
     */
    @IBInspectable dynamic open var borderColorSelected : UIColor? {
        didSet {
            refreshDisplayBorderColor()
        }
    }
    /**
     Border color for disabled state. Default is borderColorNormal.
     */
    @IBInspectable dynamic open var borderColorDisabled: UIColor? {
        didSet {
            refreshDisplayBorderColor()
        }
    }
    
    /**
     Enable highlight state when is clicked. If YES, the button is highlighted when clicked, else the button is not highlighted.
     */
    @IBInspectable dynamic open var isHighlightedEnabled: Bool = true {
        didSet {
            refreshDisplayBorderColor()
        }
    }
    
    // Store components isUserInteractionEnabled in order to restore after set another value
    fileprivate var componentsLastInteractionEnabled: Array<Bool> = Array()
    
    /**
     Set child components in order to config composite buttons. Default is empty.
     */
    @IBOutlet dynamic open var components: Array<UIButton> = Array() {
        willSet {
            // Restore user interaction enabled for removed components
            let oldComponents = components
            if (oldComponents.count <= componentsLastInteractionEnabled.count) {
                for i in 0..<oldComponents.count {
                    oldComponents[i].isUserInteractionEnabled = componentsLastInteractionEnabled[i]
                }
            }
        }
        
        didSet {
            // Disable interaction in order to propagate touch event to parent
            componentsLastInteractionEnabled.removeAll()
            for button: UIButton in self.components {
                componentsLastInteractionEnabled.append(button.isUserInteractionEnabled)
                button.isUserInteractionEnabled = false
            }
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            refreshDisplay()
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            refreshDisplay()
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            refreshDisplay()
        }
    }
}

// MARK: - Display
extension RoundedButton {
    fileprivate func refreshDisplay() {
        refreshComponentsStates()
        refreshDisplayFillColor()
        refreshDisplayBorderColor()
        refreshRounded()
    }
    
    fileprivate func refreshDisplayFillColor() {
        var fillColor: UIColor = self.fillColorNormal
        if self.state.contains(.disabled) == true {
            fillColor = self.fillColorDisabled ?? fillColor
        } else if self.state.contains(.selected) == true {
            if self.state.contains(.highlighted) == false {
                fillColor = self.fillColorSelected ?? fillColor
            } else {
                fillColor = self.fillColorNormal
            }
        } else if self.state.contains(.highlighted) == true {
            if let fillColorHighlighted: UIColor = self.fillColorHighlighted {
                fillColor = fillColorHighlighted
            } else {
                fillColor = self.fillColorNormal.darker() ?? fillColor
            }
        }
        
        self.backgroundColor = fillColor
    }
    
    fileprivate func refreshDisplayBorderColor() {
        var borderColor: UIColor = self.borderColorNormal
        if self.state.contains(.disabled) == true {
            borderColor = self.borderColorDisabled ?? borderColor
        } else if self.state.contains(.selected) == true {
            if self.state.contains(.highlighted) == false {
                borderColor = self.borderColorSelected ?? borderColor
            } else {
                borderColor = self.borderColorNormal
            }
        } else if self.state.contains(.highlighted) == true {
            if let borderColorHighlighted: UIColor = borderColorHighlighted {
                borderColor = borderColorHighlighted
            } else {
                borderColor = self.borderColorNormal.darker() ?? borderColor
            }
        }
        
        self.borderColor = borderColor
    }
    
    fileprivate func refreshComponentsStates() {
        for button: UIButton in components {
            button.isHighlighted = isHighlighted && isHighlightedEnabled
            button.isSelected = isSelected
            button.isEnabled = isEnabled
        }
    }
}
