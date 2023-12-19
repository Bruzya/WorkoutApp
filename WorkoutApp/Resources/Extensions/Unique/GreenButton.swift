//
//  GreenButton.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class GreenButton: UIButton {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(text: String) {
        self.init(type: .system)
        setTitle(text, for: .normal)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private Methods
private extension GreenButton {
    func configure() {
        backgroundColor = .mainGreen
        titleLabel?.font = .robotoBold16()
        tintColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
