//
//  CALayer+ArrangeSublayers.swift
//  RoundedUI
//
//  Created by Hien Pham on 6/19/19.
//

import Foundation

extension CALayer {
    func bringSublayerToFront(_ layer: CALayer) {
        layer.removeFromSuperlayer()
        self.addSublayer(layer)
    }
}
