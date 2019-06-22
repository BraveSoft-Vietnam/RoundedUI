//
//  RoundedShapeLayer.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/19/19.
//

import UIKit

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
        // Update content
        let path: UIBezierPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.shapeCornerRadius, roundTopLeft: roundTopLeft, roundTopRight: roundTopRight, roundBottomLeft: roundBottomLeft, roundBottomRight: roundBottomRight)
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
        let strokePath: UIBezierPath = UIBezierPath(roundedRect: self.strokeLayer.bounds, cornerRadius: self.shapeCornerRadius, roundTopLeft: roundTopLeft, roundTopRight: roundTopRight, roundBottomLeft: roundBottomLeft, roundBottomRight: roundBottomRight)
        self.strokeLayer.path = strokePath.cgPath
        let mask: CAShapeLayer = CAShapeLayer()
        mask.path = path.cgPath
        self.strokeLayer.mask = mask
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
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
        self.setUp()
    }
    
    public override init() {
        super.init()
        self.setUp()
    }
    
    open override func layoutSublayers() {
        super.layoutSublayers()
        self.strokeLayer.frame = self.bounds
        self.updateRoundCorners()
        self.bringSublayerToFront(self.strokeLayer)
    }
}
