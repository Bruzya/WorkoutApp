//
//  UIStackView + ext.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

extension UIStackView {
    convenience init(views arrangedSubviews: [UIView],into axis: NSLayoutConstraint.Axis, by spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        translatesAutoresizingMaskIntoConstraints = false
    }
}
