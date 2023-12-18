//
//  CalendarCollectionViewCell.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 17.12.2023.
//

import UIKit

final class CalendarCollectionViewCell: UICollectionViewCell {
    
    //TODO: - refactor UI
    //MARK: - UI
    private let dayOfWeeklabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.font = UIFont.robotoBold16()
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfDaylabel: UILabel = {
        let label = UILabel()
        label.text = "22"
        label.font = UIFont.robotoBold20()
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    //MARK: - Properties
    static let idCalendarCell = "idCalendarCell"
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = UIColor.mainYellow
                dayOfWeeklabel.textColor = UIColor.mainDarkGray
                numberOfDaylabel.textColor = UIColor.mainDarkGreen
            } else {
                backgroundColor = UIColor.mainGreen
                dayOfWeeklabel.textColor = .white
                numberOfDaylabel.textColor = .white
            }
        }
    }
    
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
private extension CalendarCollectionViewCell {
    func setupViews() {
        layer.cornerRadius = 10
        
        addSubview(dayOfWeeklabel)
        addSubview(numberOfDaylabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeeklabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            dayOfWeeklabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dayOfWeeklabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            numberOfDaylabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            numberOfDaylabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            numberOfDaylabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
        ])
    }
}
