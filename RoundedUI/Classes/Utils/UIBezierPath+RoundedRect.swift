//
//  UIBezierPath+RoundedRect.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/18/19.
//

import Foundation
import UIKit

extension UIBezierPath {
    convenience init(roundedRect rect: CGRect, cornerRadius: CGFloat, roundTopLeft: Bool, roundTopRight: Bool, roundBottomLeft: Bool, roundBottomRight: Bool) {
        if cornerRadius <= 0 {
            self.init(rect: rect)
            return
        }
        
        let roundAllCorners: Bool = (roundTopLeft && roundTopRight && roundBottomLeft && roundBottomRight)
        if roundAllCorners == true {
            self.init(roundedRect: rect, cornerRadius: cornerRadius)
            return
        }
        
        var corners: UIRectCorner = UIRectCorner()
        if (roundTopLeft) {
            corners.insert(.topLeft)
        }
        if (roundTopRight) {
            corners.insert(.topRight)
        }
        if (roundBottomLeft) {
            corners.insert(.bottomLeft)
        }
        if (roundBottomRight) {
            corners.insert(.bottomRight)
        }
        self.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
    }
}
