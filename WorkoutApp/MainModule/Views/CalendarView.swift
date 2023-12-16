//
//  CalendarView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 16.12.2023.
//

import UIKit

class CalendarView: UIView {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private Methods
private extension CalendarView {
    func setupViews() {
        backgroundColor = UIColor.mainGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
     func setConstraints() {
        NSLayoutConstraint.activate([
            
            
            
            
        ])
    }
}
