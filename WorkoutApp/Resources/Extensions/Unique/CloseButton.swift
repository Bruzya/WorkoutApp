//
//  CloseButton.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class CloseButton: UIButton {
    
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
private extension CloseButton {
    func configure() {
        setBackgroundImage(.closeButton, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
