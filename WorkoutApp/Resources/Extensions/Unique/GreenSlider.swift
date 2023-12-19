//
//  GreenSlider.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class GreenSlider: UISlider {
    
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
private extension GreenSlider {
    func configure() {
        maximumTrackTintColor = .subLabel
        minimumTrackTintColor = .mainGreen
        translatesAutoresizingMaskIntoConstraints = false
    }
}
