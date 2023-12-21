//
//  CalendarCollectionView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 17.12.2023.
//

import UIKit

protocol CalendarViewProtol: AnyObject {
    func selectItem(date: Date)
}

final class CalendarCollectionView: UICollectionView {
    
    //MARK: - Properties
    weak var calendarDelegate: CalendarViewProtol?
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    //MARK: - Lifecycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        configure()
        setupLayout()
        setDelegates()
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.idCalendarCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Methods
private extension CalendarCollectionView {
    func setupLayout() {
        collectionLayout.minimumInteritemSpacing = 3
    }
    
    func configure() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDelegates() {
        delegate = self
        dataSource = self
    }
}

//MARK: - UICollectionViewDataSource
extension CalendarCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.idCalendarCell, for: indexPath) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        let dateTimeZone = Date()
        let weekArray = dateTimeZone.getWeekArray()
        cell.dateForCell(numberOfDay: weekArray[1][indexPath.row], dayOfWeek: weekArray[0][indexPath.row])
        if indexPath.item == 6 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8,
               height: collectionView.frame.height)
    }
}

//MARK: - UICollectionViewDelegate
extension CalendarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dateTimeZone = Date()
        let date = dateTimeZone.offsetDay(day: 6 - indexPath.item)
        calendarDelegate?.selectItem(date: date)
    }
}
