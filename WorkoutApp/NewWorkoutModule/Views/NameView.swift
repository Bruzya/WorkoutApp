//
//  NameView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class NameView: UIView {
    
    //MARK: - UI
    private let nameLabel = UILabel(text: "Name")
    private let nameTextField = BrownTextField()
    
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
private extension NameView {
    func configure() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(nameTextField)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
