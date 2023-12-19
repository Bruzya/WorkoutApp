//
//  SliderView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class SliderView: UIView {
    
    //MARK: - UI
    private let nameLabel = UILabel(text: "",
                                    textColor: .mainLabel,
                                    font: .robotoMedium18())

    private let numberLabel = UILabel(text: "0",
                                     textColor: .mainLabel,
                                     font: .robotoMedium24())
    
    private lazy var slider = GreenSlider()
    private var sliderStackView = UIStackView()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(name: String, minValue: Float = 0, maxValue: Float) {
        self.init()
        
        configure()
        setupViews(name: name, minValue: minValue, maxValue: minValue)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private Methods
private extension SliderView {
    func configure() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureStackViews() {
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, numberLabel], axis: .horizontal, spacing: 10)
        labelsStackView.distribution = .equalSpacing
        
        sliderStackView = UIStackView(arrangedSubviews: [labelsStackView,
                                                         slider],
                                      axis: .vertical,
                                      spacing: 10)
    }
    
    func setupViews(name: String, minValue: Float, maxValue: Float) {
        nameLabel.text = name
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        configureStackViews()
        addSubview(sliderStackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            sliderStackView.topAnchor.constraint(equalTo: topAnchor),
            sliderStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sliderStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sliderStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
