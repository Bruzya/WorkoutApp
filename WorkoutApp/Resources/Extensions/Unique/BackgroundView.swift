//
//  BackgroundView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class BackgroundView: UIView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(backgroundColor: UIColor, cornerRadius: CGFloat = 10) {
        self.init()
        layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        configure()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private Methods
private extension BackgroundView {
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
