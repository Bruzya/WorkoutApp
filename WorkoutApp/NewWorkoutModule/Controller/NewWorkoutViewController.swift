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
    private let selectImageView = SelectImageView()
    private lazy var saveButton = GreenButton(text: "SAVE")
    
    private var workoutStackView = UIStackView()
    
    //MARK: - Properties
    private var workoutModel = WorkoutModel()
    private let testImage = UIImage(named: "default")
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupViews()
        setupTargets()
        addGesture()
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
                                                          selectImageView,
                                                         dateView,
                                                         repeatsView],
                                       axis: .vertical, spacing: 10)
        
        nameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        selectImageView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        dateView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        repeatsView.heightAnchor.constraint(equalToConstant: 290).isActive = true
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
        setModel()
        saveModel()
    }
    
    //MARK: - Model
    func setModel() {
        workoutModel.workoutName = nameView.getNameTextFieldText()
        workoutModel.workoutDate = dateView.getDateAndRepeat().date
        workoutModel.workoutNumberOfDay = dateView.getDateAndRepeat().date.getWeekdayNumber()
        workoutModel.workoutRepeat = dateView.getDateAndRepeat().isRepeat
        workoutModel.workoutSets = repeatsView.sets
        workoutModel.workoutReps = repeatsView.reps
        workoutModel.workoutTimer = repeatsView.timer
        
        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workoutImage = imageData
    }
    
    func saveModel() {
        let text = nameView.getNameTextFieldText()
        let count = text.filter { $0.isNumber || $0.isLetter }.count
        
        if count != 0 &&
            workoutModel.workoutSets != 0 &&
                (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
//            RealmManager.shared.saveWorkoutModel(workoutModel)
            presentSimpleAlert(title: "Success", message: nil)
            workoutModel = WorkoutModel()
            resetValues()
        } else {
            presentSimpleAlert(title: "Error", message: "Enter all parametrs")
        }
    }
    
    func resetValues() {
        nameView.deleteTextFieldName()
        dateView.resetDataAndRepeat()
        repeatsView.resetSliderViewValues()
    }
    
    //MARK: - Gesture
    func addGesture() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        let swipeScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapScreen)
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
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
