//
//  BaseActivityIndicator.swift
//  
//
//  Created by ilter on 19.03.2022.
//

import UIKit

final class BaseActivityIndicator: UIActivityIndicatorView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(activityColor: UIColor = .blue, size: UIActivityIndicatorView.Style = .large) {
        super.init(frame: .zero)
        color = activityColor
        style = size
        hidesWhenStopped = true
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureActivityIndicator() {
        hidesWhenStopped = true
    }

    func showLoading() {
        startAnimating()
    }

    func stopLoading() {
        stopAnimating()
    }
}
