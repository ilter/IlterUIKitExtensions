//
//  BaseUILabel.swift
//  
//
//  Created by ilter on 19.03.2022.
//

import UIKit

final class BaseUILabel: UILabel {
    
    enum ButtonConstants {
        static let buttonFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
        static let mediumFontSize: CGFloat = 20.0
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    init(textAlignment: NSTextAlignment = .center,
         font: UIFont = ButtonConstants.buttonFont,
         fontSize: CGFloat = ButtonConstants.mediumFontSize,
         fontWeight: UIFont.Weight,
         color: UIColor? = .label,
         numberOfLines: Int = .zero) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.textColor = color
        configureLabel()
    }

    private func configureLabel() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
