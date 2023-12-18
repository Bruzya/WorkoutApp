//
//  MainViewController.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 16.12.2023.
//

import UIKit

final class MainViewController: UIViewController {

    //TODO: - Refactor UI via MVC into view module
    //TODO: - refactor via uiview constructor to reduce code
    //MARK: - UI
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.subLabel
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Labels.userName
        label.font = UIFont.robotoMedium16()
        label.textColor = UIColor.mainLabel
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    private let workoutTodayLabel = UILabel(text: "Workout today")
    private let tableView = MainTableView()
    
    //TODO: - refactor with UIButtonConfiguration
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.mainYellow
        button.layer.cornerRadius = 15
        button.setImage(.plusButton, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0,
                                              left: 20,
                                              bottom: 15,
                                              right: 0)
        button.setTitle(Constants.Labels.addWorkoutButton, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 50,
                                              left: -40,
                                              bottom: 0,
                                              right: 0)
        button.titleLabel?.font = UIFont.robotoMedium12()
        button.tintColor = UIColor.mainDarkGreen
        button.addShadowOnView()
        button.addTarget(self, action: #selector(addWorkoutButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
}

//MARK: - Private Methods
private extension MainViewController {
    func setupViews() {
        view.backgroundColor = UIColor.mainBackground
        
        //TODO: - StackView
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(tableView)
        
    }
    
    @objc func addWorkoutButtonPressed() {
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
        
            calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            calendarView.leadingAnchor.constraint(equalTo: userPhotoImageView.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 75),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor),
            addWorkoutButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.205),
            addWorkoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.205),
            
            weatherView.topAnchor.constraint(equalTo: addWorkoutButton.topAnchor),
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            weatherView.heightAnchor.constraint(equalTo: addWorkoutButton.heightAnchor),
            
            workoutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: addWorkoutButton.leadingAnchor),
            workoutTodayLabel.widthAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
