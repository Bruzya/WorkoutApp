//
//  WeatherView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 17.12.2023.
//

import UIKit

final class WeatherView: UIView {
    
    //TODO: - refactor UILabels by constructor
    //MARK: - UI
    private let weatherLabel = UILabel(text: Constants.Labels.weatherTitle,
                                       textColor: .mainLabel,
                                       font: .robotoMedium18())
    private let descriptionLabel = UILabel(text: Constants.Labels.weatherDescription,
                                           textColor: .subLabel,
                                           font: .robotoMedium12(),
                                           numberOfLines: 2)
    
    private let weatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.Images.sun)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
private extension WeatherView {
    func configure() {
        backgroundColor = .weatherViewBackground
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
    }
    
    func setupViews() {
        addSubview(weatherLabel)
        addSubview(descriptionLabel)
        addSubview(weatherImage)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            weatherImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),

            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabel.trailingAnchor.constraint(equalTo: weatherImage.leadingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: weatherLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: weatherLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
