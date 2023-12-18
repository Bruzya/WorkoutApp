//
//  UILabel + ext.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String,
                     textColor: UIColor = UIColor.mainSubLabel,
                     font: UIFont? = UIFont.robotoMedium14(),
                     numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
