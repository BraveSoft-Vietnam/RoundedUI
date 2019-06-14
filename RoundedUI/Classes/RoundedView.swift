//
//  RoundedView.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/14/19.
//

import UIKit

/**
 Convenient view for easier customize round corners in interface builder. Also support shadow config.
 */
@IBDesignable
open class RoundedView: UIView {
    /**
     Border color. Default is clear color.
     */
    @IBInspectable open var borderColor: UIColor? {
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
