//
//  UIColor+Darker.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/14/19.
//

import Foundation
import UIKit

extension UIColor {
    internal func lighter(offset: CGFloat = 0.2) -> UIColor? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: CGFloat.minimum(r + offset, 1.0), green: g, blue: b, alpha: a)
        }
        return nil
    }
    
    internal func darker(offset: CGFloat = 0.2) -> UIColor? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: CGFloat.maximum(r - offset, 0.0), green: g, blue: b, alpha: a)
        }
        return nil
    }
}
