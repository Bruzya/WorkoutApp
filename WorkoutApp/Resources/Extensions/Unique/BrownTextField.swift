//
//  BrownTextField.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class BrownTextField: UITextField {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private Methods
private extension BrownTextField {
    func configure() {
            backgroundColor = .cellBackground
            layer.cornerRadius = 10
            borderStyle = .none
            textColor = .mainLabel
            font = .robotoBold20()
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
            leftViewMode = .always
            clearButtonMode = .always
            returnKeyType = .done
            translatesAutoresizingMaskIntoConstraints = false
    }
}
