//
//  UILabel + ext.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        textColor = UIColor.mainSubLabel
        font = UIFont.robotoMedium14()
        numberOfLines = 1
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
