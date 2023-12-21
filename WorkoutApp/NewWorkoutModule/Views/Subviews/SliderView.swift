//
//  SliderView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

protocol SliderViewProtocol: AnyObject {
    func changeValue(type: SliderType, value: Int)
}

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
    
    //MARK: - Properties
    private var sliderType: SliderType?
    weak var delegate: SliderViewProtocol?
    
    var isActive: Bool = true {
        didSet {
            if isActive {
                nameLabel.alpha = 1
                numberLabel.alpha = 1
                slider.alpha = 1
            } else {
                nameLabel.alpha = 0.5
                numberLabel.alpha = 0.5
                slider.alpha = 0.5
                slider.value = 0
                numberLabel.text = "0"
            }
        }
    }
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(name: String, minValue: Float = 0, maxValue: Float, type: SliderType) {
        self.init()
        
        sliderType = type
        
        configure()
        setupViews(name: name, minValue: minValue, maxValue: maxValue)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - open Methods
    func resetValues() {
        numberLabel.text = "0"
        slider.value = 0
        isActive = true
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
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        configureStackViews()
        addSubview(sliderStackView)
    }
    
    
    @objc func sliderChanged() {
        let intValueSlider = Int(slider.value)
        numberLabel.text = sliderType == .timer ? intValueSlider.getTimeFromSecond() : "\(intValueSlider)"
        guard let type = sliderType else { return }
        delegate?.changeValue(type: type, value: intValueSlider)
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
