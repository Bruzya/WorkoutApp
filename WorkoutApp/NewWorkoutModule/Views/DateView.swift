//
//  DateAndRepeatView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class DateView: UIView {
    
    //MARK: - UI
    private let dateAndRepeatLabel = UILabel(text: "Date and Repeat")
    private let backgroundView = BackgroundView(backgroundColor: .cellBackground)
    private let dateLabel = UILabel(text: "Date",
                                    textColor: .mainLabel,
                                    font: .robotoMedium18())
    private let repeatLabel = UILabel(text: "Repeat every 7 days",
                                      textColor: .mainLabel,
                                      font: .robotoMedium18())
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .mainGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .mainGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()

    private var dateAndRepeatStackView = UIStackView()

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
    
    //MARK: - open Methods
    func getDateAndRepeat() -> (date: Date, isRepeat: Bool) {
        (datePicker.date, repeatSwitch.isOn)
    }
    
    func resetDataAndRepeat() {
        datePicker.date = Date()
        repeatSwitch.isOn = true
    }
}

//MARK: - private Methods
private extension DateView {
    func configure() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureStackViews() {
        let datePickerStackView = UIStackView(arrangedSubviews: [dateLabel,
                                                             datePicker],
                                          axis: .horizontal,
                                          spacing: 10)
        datePickerStackView.distribution = .equalSpacing
        let switchStackView = UIStackView(arrangedSubviews: [repeatLabel,
                                                        repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
        switchStackView.distribution = .equalSpacing
        dateAndRepeatStackView = UIStackView(arrangedSubviews: [datePickerStackView,
                                                      switchStackView], axis: .vertical, spacing: 10)
    }
    
    func setupViews() {
        addSubview(dateAndRepeatLabel)
        addSubview(backgroundView)
        configureStackViews()
        addSubview(dateAndRepeatStackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: topAnchor),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            backgroundView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 5),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            dateAndRepeatStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            dateAndRepeatStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            dateAndRepeatStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15),
        ])
    }
}
