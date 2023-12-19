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
    private let dayOfWeekLabel = UILabel(text: "We",
                                         textColor: .white,
                                         font: .robotoBold16())
    private let numberOfDayLabel = UILabel(text: "22",
                                         textColor: .white,
                                         font: .robotoBold20())
    
    //MARK: - Properties
    static let idCalendarCell = "idCalendarCell"
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = UIColor.mainYellow
                dayOfWeekLabel.textColor = UIColor.mainDarkGray
                numberOfDayLabel.textColor = UIColor.mainDarkGreen
            } else {
                backgroundColor = UIColor.mainGreen
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private Methods
private extension CalendarCollectionViewCell {
    func configure() {
        layer.cornerRadius = 10
    }
    
    func setupViews() {
        dayOfWeekLabel.textAlignment = .center
        numberOfDayLabel.textAlignment = .center
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            dayOfWeekLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dayOfWeekLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            numberOfDayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            numberOfDayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
        ])
    }
}
