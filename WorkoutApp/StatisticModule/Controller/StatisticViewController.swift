//
//  StatisticViewController.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

class StatisticViewController: UIViewController {
    
    //MARK: - UI
    private let statisticLabel: UILabel = {
        let label = UILabel()
        label.text = "STATISTIC"
        label.textColor = UIColor.mainLabel
        label.font = UIFont.robotoMedium24()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Week", "Month"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .mainGreen
        segmentedControl.selectedSegmentTintColor = .mainYellow
        let font = UIFont.robotoMedium16()
        segmentedControl.setTitleTextAttributes([.font: font as Any,
                                                 .foregroundColor: UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.font: font as Any,
                                                 .foregroundColor: UIColor.mainLabel],for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let exercisesLabel = UILabel(text: "Exercises")
    private let tableView = StatisticTableView()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
}

//MARK: - private Methods
private extension StatisticViewController {
    func setupViews() {
        view.backgroundColor = .mainBackground
        
        view.addSubview(statisticLabel)
        view.addSubview(segmentedControl)
        view.addSubview(exercisesLabel)
        view.addSubview(tableView)
    }
    
    @objc func segmentedChanged() {
        segmentedControl.selectedSegmentIndex == 0 ? print("Week") : print("Month")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            statisticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            statisticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            statisticLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            segmentedControl.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            exercisesLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exercisesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
