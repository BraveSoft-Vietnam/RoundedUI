//
//  RoundedShapeLayer.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/19/19.
//

import UIKit

/**
 Layer class implementing advance round corners features.
 
 Note: This class override default value of fillColor from black to clear color.
 */
open class RoundedShapeLayer: CAShapeLayer {
    open var roundTopLeft: Bool = true {
        didSet {
            self.updateRoundCorners()
        }
    }
    open var roundTopRight: Bool = true {
        didSet {
            self.updateRoundCorners()
        }
    }
    open var roundBottomLeft: Bool = true {
        didSet {
            self.updateRoundCorners()
        }
    }
    open var roundBottomRight: Bool = true {
        didSet {
            self.updateRoundCorners()
        }
    }
    
    fileprivate func updateRoundCorners() {
        cornerRadius = 0
        
        let path: UIBezierPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.shapeCornerRadius, roundTopLeft: roundTopLeft, roundTopRight: roundTopRight, roundBottomLeft: roundBottomLeft, roundBottomRight: roundBottomRight)

        // Update content
        self.path = path.cgPath

        // Update mask
        if self.masksToBounds == true {
            let mask: CAShapeLayer = CAShapeLayer()
            mask.path = path.cgPath
            self.mask = mask
        } else {
            self.mask = nil
        }

        // Update stroke
        self.strokeLayer.path = path.cgPath
        let mask: CAShapeLayer = CAShapeLayer()
        mask.path = path.cgPath
        self.strokeLayer.mask = mask
    }
    
    open override var masksToBounds: Bool {
        didSet {
            self.updateRoundCorners()
        }
    }
    
    open var shapeCornerRadius: CGFloat = 0 {
        didSet {
            self.updateRoundCorners()
        }
    }
    
    open private(set) var strokeLayer: CAShapeLayer = CAShapeLayer()
    
    fileprivate func setUp() {
        self.addSublayer(self.strokeLayer)
        self.strokeLayer.fillColor = UIColor.clear.cgColor
        self.fillColor = UIColor.clear.cgColor
    }
    
    public override init() {
        super.init()
        self.setUp()
    }
    
    public override init(layer: Any) {
        super.init()
        self.setUp()
    }
        
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSublayers() {
        super.layoutSublayers()
        self.strokeLayer.frame = self.bounds
        self.updateRoundCorners()
        self.bringSublayerToFront(self.strokeLayer)
    }
}
