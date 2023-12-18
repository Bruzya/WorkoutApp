//
//  UIMainTableViewCell.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    //MARK: - UI
    private let backgroundCell: UIView = {
        let view = UIView()
         view.layer.cornerRadius = 20
         view.backgroundColor = UIColor.cellBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutBackgroundView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.mainBackground
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
    
    private let workoutImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let workoutNameLabel = UILabel(text: "Pull Ups", textColor: .cellLabel, font: .robotoMedium22())
    private let workoutRepsLabel = UILabel(text: "Reps: 10", textColor: .mainLabel, font: .robotoMedium16())
    private let workoutSetsLabel = UILabel(text: "Sets: 2", textColor: .mainLabel, font: .robotoMedium16())
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("START", for: .normal)
        button.backgroundColor = UIColor.mainYellow
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.robotoBold16()
        button.tintColor = UIColor.mainDarkGreen
        button.addShadowOnView()
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var labelsStackView = UIStackView()
    
    //MARK: - Properties
    static let idTableViewCell = "idTableViewCell"

    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private Methods
private extension MainTableViewCell {
    func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(workoutBackgroundView)
        workoutBackgroundView.addSubview(workoutImageView)
        addSubview(workoutNameLabel)
        
        labelsStackView = UIStackView(arrangedSubviews: [workoutRepsLabel,
                                                         workoutSetsLabel],
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(labelsStackView)
        contentView.addSubview(startButton)
    }
    
    @objc func startButtonTapped() {
        print("self tapped")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            workoutBackgroundView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            workoutBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            workoutBackgroundView.widthAnchor.constraint(equalToConstant: 70),
            
            workoutImageView.topAnchor.constraint(equalTo: workoutBackgroundView.topAnchor, constant: 10),
            workoutImageView.leadingAnchor.constraint(equalTo: workoutBackgroundView.leadingAnchor, constant: 10),
            workoutImageView.trailingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: -10),
            workoutImageView.bottomAnchor.constraint(equalTo: workoutBackgroundView.bottomAnchor, constant: -10),
            
            workoutNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            workoutNameLabel.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            
            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 0),
            labelsStackView.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20),
            
            startButton.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            startButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
