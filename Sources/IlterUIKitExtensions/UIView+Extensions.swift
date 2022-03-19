//
//  File.swift
//  
//
//  Created by ilter on 19.03.2022.
//

import Foundation
import UIKit

public extension UIView {

    /// Creates Fade Transition and adds to the given view's layer with `duration`
    /// - Parameters:
    ///   - duration: CFTimeInterval value to set transtion animation time.
    func fadeTransition(_ duration: CFTimeInterval = .zero) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    /// Creates shadow layer and adds to the given view's layer.
    /// - Parameters:
    ///   - shadowColor: Shadow color initially set to black.
    ///   - shadowOpacity: Opacity of the shadow, initially set to one.
    ///   - shadowRadius: Radius of the shadow layer, initially set to five.
    ///   - shadowOffset: Offset of the shadow layer, initially set to zero
    func applyShadow(shadowColor: CGColor = UIColor.black.cgColor,
                     shadowOpacity: Float = 1.0,
                     shadowRadius: CGFloat = 5.0,
                     shadowOffset: CGSize = .zero,
                     masksToBounds: Bool = false,
                     clipsToBounds: Bool = false) {
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.masksToBounds = masksToBounds
        self.clipsToBounds = clipsToBounds
    }
}
