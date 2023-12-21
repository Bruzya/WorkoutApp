//
//  UIViewController + ext.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 20.12.2023.
//

import UIKit

extension UIViewController {
    func presentSimpleAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}
