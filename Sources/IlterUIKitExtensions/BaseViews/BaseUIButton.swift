//
//  BaseUIButton.swift
//  
//
//  Created by ilter on 19.03.2022.
//

import Foundation
import UIKit

class BaseUIButton: UIButton {

    enum ButtonConstants {
        static let defaultCornerRadius: CGFloat = 10.0
        static let headlineFont: UIFont = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(backgroundColor: UIColor,
         title: String,
         cornerRadius: CGFloat = ButtonConstants.defaultCornerRadius,
         textColor: UIColor = .white,
         font: UIFont = ButtonConstants.headlineFont) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = cornerRadius
        titleLabel?.font = font
        translatesAutoresizingMaskIntoConstraints = false
    }
}
