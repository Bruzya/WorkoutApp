//
//  NewWorkoutViewController.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class NewWorkoutViewController: UIViewController {
    
    //MARK: - UI
    private let newWorkoutLabel = UILabel(titleText: "NEW WORKOUT")
    private lazy var closeButton = CloseButton(type: .system)
    private let nameView = NameView()
    private let dateView = DateView()
    private let repeatsView = RepeatsView()
    private lazy var saveButton = GreenButton(text: "SAVE")
    
    private var workoutStackView = UIStackView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupViews()
        setupTargets()
        setConstraints()
    }
}

//MARK: - private Methods
private extension NewWorkoutViewController {
    func configure() {
        view.backgroundColor = .mainBackground
    }
    
    func configureStackView() {
        workoutStackView = UIStackView(arrangedSubviews: [nameView,
                                                         dateView,
                                                         repeatsView],
                                       axis: .vertical, spacing: 20)
        
        nameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        dateView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        repeatsView.heightAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupViews() {
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        configureStackView()
        view.addSubview(workoutStackView)
        view.addSubview(saveButton)
    }
    
    //TODO: - refactor via MVC \ MVP closure or protocols
    func setupTargets() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveButtonTapped() {
        print("save tapped")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            
            workoutStackView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            workoutStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            workoutStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            saveButton.topAnchor.constraint(equalTo: repeatsView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
