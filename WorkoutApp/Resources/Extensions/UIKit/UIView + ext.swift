//
//  UIView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 16.12.2023.
//

import UIKit

extension UIView {
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1
    }
}
