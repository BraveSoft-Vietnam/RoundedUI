//
//  UIView+RoundedUI.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/14/19.
//

import Foundation
import UIKit

fileprivate struct AssociatedKeys {
    static var isCircle: UInt8 = 0
}

protocol RoundedViewProtocol {}

/**
 Convenient extension for setting CALayer's rounded corners attributes directly from UIView
 
 Note: Please don't use this extension directly. Instead use RoundedView or RoundedButton in order to make preview in Interface Builder work.
 */
@IBDesignable public extension UIView {
    /**
     Line stroke width. Default is 0
     */
    @IBInspectable dynamic var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    /**
     Rounded corner radius. Default is 0
     */
    @IBInspectable dynamic var cornerRadius: CGFloat {
        set {
            refreshRounded(cornerRadius: newValue)
        }
        get {
            return layer.cornerRadius
        }
    }
    /**
     Try to round as circle. If `true`, `cornerRadius` will be ignore.
     */
    @IBInspectable dynamic var isCircle: Bool {
        get {
            let defaultValue = false
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.isCircle) as? Bool else {
                return defaultValue
            }
            return value
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isCircle, newValue, .OBJC_ASSOCIATION_COPY)
            refreshRounded()
        }
    }
    
    func refreshRounded() {
        refreshRounded(cornerRadius: cornerRadius)
    }
    
    fileprivate func refreshRounded(cornerRadius: CGFloat) {
        let drawRadius = isCircle == true ? min(self.bounds.size.height, self.bounds.size.width) / 2 : cornerRadius
        layer.cornerRadius = drawRadius
    }
}

/**
 Convenient extension for setting CALayer's shadow attributes directly from UIView
 
 Note: Please don't use this extension directly. Instead use RoundedView or RoundedButton in order to make preview in Interface Builder work.
 */
@IBDesignable public extension UIView {
    /**
     The color of the layer’s shadow.
     
     The default value of this property is an opaque black color.
     
     Note: When config shadow please make sure clipsToBound is turned off or shadow will not be visible
     */
    @IBInspectable dynamic var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue?.cgColor
        }
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    /**
     The blur radius (in points) used to render the layer’s shadow.
     
     You specify the radius The default value of this property is 3.0.
     
     Note: When config shadow please make sure clipsToBound is turned off or shadow will not be visible
     */
    @IBInspectable dynamic var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    /**
     The offset (in points) of the layer’s shadow.
     
     The default value of this property is (0.0, -3.0).
     
     Note: When config shadow please make sure clipsToBound is turned off or shadow will not be visible
     */
    @IBInspectable dynamic var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
        }
        get {
            return layer.shadowOffset
        }
    }
    /**
     The opacity of the layer’s shadow.
     
     The value in this property must be in the range 0.0 (transparent) to 1.0 (opaque). The default value of this property is 0.0.
     Note: When config shadow please make sure clipsToBound is turned off or shadow will not be visible
     */
    @IBInspectable dynamic var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    /**
     Border color. Default is clear color.
     */
    @IBInspectable dynamic var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }

}
