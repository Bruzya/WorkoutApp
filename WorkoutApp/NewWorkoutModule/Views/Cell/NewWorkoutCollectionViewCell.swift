//
//  NewWorkoutCollectionViewCell.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

class NewWorkoutCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI
    private let imageBackgroundView = BackgroundView(backgroundColor: .mainBackground,
                                                       cornerRadius: 20)
    private let workoutImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "default")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .mainDarkGreen
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - Properties
    static let idNewWorkoutCell = "idNewWorkoutCell"
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                workoutImageView.tintColor = .white
                imageBackgroundView.backgroundColor = .mainGreen
            } else {
                workoutImageView.tintColor = .mainDarkGreen
                imageBackgroundView.backgroundColor = .mainBackground
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
private extension NewWorkoutCollectionViewCell {
    func configure() {
        backgroundColor = .clear
    }
    
    func setupViews() {
        addSubview(imageBackgroundView)
        imageBackgroundView.addSubview(workoutImageView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            imageBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            
            
            workoutImageView.topAnchor.constraint(equalTo: imageBackgroundView.topAnchor, constant: 5),
            workoutImageView.leadingAnchor.constraint(equalTo: imageBackgroundView.leadingAnchor, constant: 5),
            workoutImageView.trailingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: -5),
            workoutImageView.bottomAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: -5)
        ])
    }
}
