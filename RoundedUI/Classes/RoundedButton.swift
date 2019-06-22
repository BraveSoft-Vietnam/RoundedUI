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
    @IBInspectable open var fillColorNormal: UIColor = .clear {
        didSet {
            self.refreshDisplayFillColor()
        }
    }
    /**
     Fill color for highlighted state. Default is fillColorNormal with darker tone.
     */
    @IBInspectable open var fillColorHighlighted: UIColor? {
        didSet {
            self.refreshDisplayFillColor()
        }
    }
    /**
     Fill color for selected state. Default is fillColorNormal.
     */
    @IBInspectable open var fillColorSelected: UIColor? {
        didSet {
            self.refreshDisplayFillColor()
        }
    }
    /**
     Fill color for disabled state. Default is fillColorNormal.
     */
    @IBInspectable open var fillColorDisabled: UIColor? {
        didSet {
            self.refreshDisplayFillColor()
        }
    }
    /**
     Border color for normal state.
     */
    @IBInspectable open var borderColorNormal: UIColor = .clear {
        didSet {
            self.refreshDisplayBorderColor()
        }
    }
    /**
     Border color for highlighted state. Default is borderColorNormal with darker tone.
     */
    @IBInspectable open var borderColorHighlighted: UIColor? {
        didSet {
            self.refreshDisplayBorderColor()
        }
    }
    /**
     Border color for selected state. Default is borderColorNormal.
     */
    @IBInspectable open var borderColorSelected : UIColor? {
        didSet {
            self.refreshDisplayBorderColor()
        }
    }
    /**
     Border color for disabled state. Default is borderColorNormal.
     */
    @IBInspectable open var borderColorDisabled: UIColor? {
        didSet {
            self.refreshDisplayBorderColor()
        }
    }
    
    /**
     Enable highlight state when is clicked. If YES, the button is highlighted when clicked, else the button is not highlighted.
     */
    @IBInspectable open var isHighlightedEnabled: Bool = true {
        didSet {
            self.refreshDisplayBorderColor()
        }
    }
    
    // Store components isUserInteractionEnabled in order to restore after set another value
    fileprivate var componentsLastInteractionEnabled: Array<Bool> = Array()
    
    /**
     Set child components in order to config composite buttons. Default is empty.
     */
    @IBOutlet open var components: Array<UIButton> = Array() {
        willSet {
            // Restore user interaction enabled for removed components
            if (self.components.count <= self.componentsLastInteractionEnabled.count) {
                for i in 0..<self.components.count {
                    self.components[i].isUserInteractionEnabled = self.componentsLastInteractionEnabled[i]
                }
            }
        }
        
        didSet {
            // Disable interaction in order to propagate touch event to parent
            self.componentsLastInteractionEnabled.removeAll()
            for button: UIButton in self.components {
                self.componentsLastInteractionEnabled.append(button.isUserInteractionEnabled)
                button.isUserInteractionEnabled = false
            }
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            self.refreshDisplay()
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            self.refreshDisplay()
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            self.refreshDisplay()
        }
    }
}

// MARK: - Display
extension RoundedButton {
    fileprivate func refreshDisplay() {
        self.refreshComponentsStates()
        self.refreshDisplayFillColor()
        self.refreshDisplayBorderColor()
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
            if let borderColorHighlighted: UIColor = self.borderColorHighlighted {
                borderColor = borderColorHighlighted
            } else {
                borderColor = self.borderColorNormal.darker() ?? borderColor
            }
        }
        
        self.borderColor = borderColor
    }
    
    fileprivate func refreshComponentsStates() {
        for button: UIButton in self.components {
            button.isHighlighted = self.isHighlighted && self.isHighlightedEnabled
            button.isSelected = self.isSelected
            button.isEnabled = self.isEnabled
        }
    }
}
