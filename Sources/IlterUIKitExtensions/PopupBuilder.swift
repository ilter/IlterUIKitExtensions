//
//  PopupBuilder.swift
//  
//
//  Created by ilter on 19.03.2022.
//

import UIKit

public protocol PopupBuilder where Self: UIViewController {
    func showPopupAlert(title: String,
                        message: String,
                        buttonTitle: String)
}

public extension PopupBuilder {
    /// Presents Alert-PopUpView on the related screen.
    /// - Parameters:
    ///   - title: Title text of pop-up view.
    ///   - message: Message will shown in the middle
    ///   - buttonTitle: Title of the Button
    func showPopupAlert(title: String,
                        message: String,
                        buttonTitle: String) {
        let alertPopUp = AlertPopupViewController(title: title, message: message, buttonTitle: buttonTitle)
        alertPopUp.modalPresentationStyle = .overFullScreen
        alertPopUp.modalTransitionStyle = .crossDissolve
        present(alertPopUp, animated: true)
    }
}
