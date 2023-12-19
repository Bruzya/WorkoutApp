//
//  RepeatsView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class RepeatsView: UIView {
    
    //MARK: - UI
    private let repsOrTimerLabel = UILabel(text: "Reps or Timer")
    private let backgroundView = BackgroundView(backgroundColor: .cellBackground)
    private let chooseLabel = UILabel(text: "Choose repeat or timer")

    private lazy var setsView = SliderView(name: "Sets", maxValue: 10)
    private lazy var repsView = SliderView(name: "Reps", maxValue: 50)
    private lazy var timerView = SliderView(name: "Timer", maxValue: 600)
    
    private var slidersStackView = UIStackView()
    
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
private extension RepeatsView {
    func configure() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureStackViews() {
        slidersStackView = UIStackView(arrangedSubviews: [setsView,
                                                         chooseLabel,
                                                         repsView,
                                                         timerView],
                                       axis: .vertical, spacing: 5)
        slidersStackView.distribution = .equalSpacing
    }
    
    func setupViews() {
        chooseLabel.textAlignment = .center
        
        addSubview(repsOrTimerLabel)
        addSubview(backgroundView)
        configureStackViews()
        addSubview(slidersStackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: topAnchor),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            backgroundView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 5),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            slidersStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            slidersStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            slidersStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15)
        ])
    }
}
