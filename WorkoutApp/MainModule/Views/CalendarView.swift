//
//  CalendarView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 16.12.2023.
//

import UIKit

final class CalendarView: UIView {
    
    //MARK: - UI
    private let collectionView = CalendarCollectionView()
    
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
    
    //MARK: - open Methods
    func setDelegates(_ delegate: CalendarViewProtol) {
        collectionView.calendarDelegate = delegate
    }
}

//MARK: - private Methods
private extension CalendarView {
    func configure() {
        backgroundColor = UIColor.mainGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViews() {
        addSubview(collectionView)
    }
    
     func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
