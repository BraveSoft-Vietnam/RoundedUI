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
    open override func layoutSubviews() {
        super.layoutSubviews()
        refreshRounded()
    }
}
