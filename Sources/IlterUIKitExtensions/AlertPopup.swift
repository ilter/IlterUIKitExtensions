//
//  AlertPopup.swift
//  
//
//  Created by ilter on 19.03.2022.
//

import Foundation
import UIKit

final class AlertPopupViewController: UIViewController {
    private enum PopupConstants {
        static let popUpBackgroundColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.70)
        static let messageLabelNumOfLines: Int = 4
        static let mediumFontSize: CGFloat = 20.0
        static let popUpButtonTitle: String = "Close"

        
        enum Styling {
            static let maxCornerRadius: CGFloat = 16.0
            static let popUpWidth: CGFloat = 280
            static let popUpHeight: CGFloat = 220
            static let minimumBorderWidth: CGFloat = 2.0
            static let minimumSpacing: CGFloat = 8.0
            static let defaultSpacing: CGFloat = 12.0
            static let maxSpacing: CGFloat = 20.0
            static let defaultLabelHeight: CGFloat = 36.0
        }
    }
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    let titleLabel = BaseUILabel(textAlignment: .center, fontSize: PopupConstants.mediumFontSize, fontWeight: .bold)
    let messageLabel = BaseUILabel(textAlignment: .center, fontWeight: .regular, color: .secondaryLabel)
    let button = BaseUIButton(backgroundColor: .systemBlue, title: PopupConstants.popUpButtonTitle)

    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?

    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PopupConstants.popUpBackgroundColor
        setupUI()
    }

    private func setupUI() {
        view.addSubview(containerView)
        [titleLabel, messageLabel, button].forEach { containerView.addSubview($0) }

        configureContainerView()
        configureTitleView()
        configureMessageLabel()
        configureButton()
    }
}

extension AlertPopupViewController {

    private func configureContainerView() {
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = PopupConstants.Styling.maxCornerRadius
        containerView.layer.borderWidth = PopupConstants.Styling.minimumBorderWidth
        containerView.layer.borderColor = UIColor.white.cgColor

        containerView.configureConstraint(centerX: (view.centerXAnchor, .zero), centerY: (view.centerYAnchor, .zero))
        containerView.configureWidth(width: PopupConstants.Styling.popUpWidth)
        containerView.configureHeight(height: PopupConstants.Styling.popUpHeight)
    }

    private func configureTitleView() {
        titleLabel.text = alertTitle

        titleLabel.configureConstraint(top: (containerView.topAnchor, PopupConstants.Styling.maxSpacing),
                                       bottom: (messageLabel.topAnchor, -PopupConstants.Styling.defaultSpacing),
                                       leading: (containerView.leadingAnchor, PopupConstants.Styling.maxSpacing),
                                       trailing: (containerView.trailingAnchor, -PopupConstants.Styling.maxSpacing))
    }

    private func configureMessageLabel() {
        messageLabel.text = message
        messageLabel.numberOfLines = PopupConstants.messageLabelNumOfLines

        messageLabel.configureConstraint(bottom: (button.topAnchor, -PopupConstants.Styling.maxSpacing),
                                         leading: (containerView.leadingAnchor, PopupConstants.Styling.maxSpacing),
                                         trailing: (containerView.trailingAnchor, -PopupConstants.Styling.maxSpacing))
    }

    private func configureButton() {
        button.setTitle(buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(dismissAlertPopup), for: .touchUpInside)

        button.configureConstraint(bottom: (containerView.bottomAnchor, -PopupConstants.Styling.maxSpacing),
                                   leading: (containerView.leadingAnchor, PopupConstants.Styling.maxSpacing),
                                   trailing: (containerView.trailingAnchor, -PopupConstants.Styling.maxSpacing))

        button.configureHeight(height: PopupConstants.Styling.defaultLabelHeight)
    }

    @objc private func dismissAlertPopup() {
        dismiss(animated: true, completion: nil)
    }
}
