//
//  StatisticTableViewCell.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    //MARK: - UI
    private let differenceLabel = UILabel(text: "+2",
                                          textColor: .mainGreen,
                                          font: .robotoMedium24())
    private let exercisesNameLabel = UILabel(text: "Biceps",
                                             textColor: .mainLabel,
                                             font: .robotoMedium24())
    
    private let beforeLabel = UILabel(text: "Before: 18")
    private let nowLabel = UILabel(text: "Now: 20")
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .separatorLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var labelsStackView = UIStackView()
    
    //TODO: - refactor via constants class
    //MARK: - Properties
    static let idStatisticTableViewCell = "idStatisticTableViewCell"
    
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
private extension StatisticTableViewCell {
    func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(differenceLabel)
        addSubview(exercisesNameLabel)
        
        labelsStackView = UIStackView(arrangedSubviews: [beforeLabel,
                                                         nowLabel],
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(labelsStackView)
        addSubview(lineView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            differenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            differenceLabel.widthAnchor.constraint(equalToConstant: 50),
            
            exercisesNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            exercisesNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            exercisesNameLabel.trailingAnchor.constraint(equalTo: differenceLabel.leadingAnchor, constant: -20),
            
            labelsStackView.topAnchor.constraint(equalTo: exercisesNameLabel.bottomAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
