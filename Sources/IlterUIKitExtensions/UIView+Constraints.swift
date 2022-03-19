//
//  File.swift
//  
//
//  Created by ilter on 19.03.2022.
//

import UIKit

public extension UIView {

    /// Adds constraints using NSLayoutAnchors, based on description provided in params.
    /// It directly adds CGFloat constant to given anchor and activates
    ///
    /// - Parameters:
    ///   - top: Tuple to give NSLayoutAnchor and CFFloat constant to set topAnchor.
    ///   - bottom: Tuple to give NSLayoutAnchor and CFFloat constant to set bottomAnchor.
    ///   - leading: Tuple to give NSLayoutAnchor and CFFloat constant to set leadingAnchor.
    ///   - trailing: Tuple to give NSLayoutAnchor and CFFloat constant to set trailingAnchor.
    ///   - centerX: Tuple to give NSLayoutAnchor and CFFloat constant to set centerXAnchor.
    ///   - centerY: Tuple to give NSLayoutAnchor and CFFloat constant to set centerYAnchor.
    /// - Returns: Apply each constaints active according to given value.
    func configureConstraint(top: (NSLayoutYAxisAnchor, CGFloat)? = nil,
                             bottom: (NSLayoutYAxisAnchor, CGFloat)? = nil,
                             leading: (NSLayoutXAxisAnchor, CGFloat)? = nil,
                             trailing: (NSLayoutXAxisAnchor, CGFloat)? = nil,
                             centerX: (NSLayoutXAxisAnchor, CGFloat)? = nil,
                             centerY: (NSLayoutYAxisAnchor, CGFloat)? = nil) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top.0, constant: top.1).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom.0, constant: bottom.1).isActive = true
        }

        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading.0, constant: leading.1).isActive = true
        }

        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing.0, constant: trailing.1).isActive = true
        }

        if  let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX.0, constant: centerX.1).isActive = true
        }

        if  let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY.0, constant: centerY.1).isActive = true

        }
    }

    /// Configure its width by the given width value.
    /// - Parameters:
    ///   - width: CGFloat value to set your widthAnchor's value.
    func configureWidth(width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    /// Configure its height by the given height value.
    /// - Parameters:
    ///   - height: CGFloat value to set your heightAnchor's value.
    func configureHeight(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    /// Pin view edged to its superview.
    /// - Parameter insets: Intests value between view and it's superview. Initially value is set to `zero`.
    func pinViewEdgesToSuperView(insets: CGFloat = .zero) {
        guard let superview = superview else {
            fatalError("🚨 Couldn't find the superview while pinning edges.")
        }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: insets).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets).isActive = true
    }

    /// Pin view to the center of the super view with given coordinates.
    /// - Parameters:
    ///   - xCoordinate: x coordinate value from the superview center.
    ///   - yCoordinate: y coordinate value from the superview center.
    func alignCenter(xCoordinate: CGFloat = .zero, yCoordinate: CGFloat = .zero) {
        guard let superview = superview else {
            fatalError("🚨 Couldn't find the superview while alignning the center")
        }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: xCoordinate).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: yCoordinate).isActive = true
    }
}
