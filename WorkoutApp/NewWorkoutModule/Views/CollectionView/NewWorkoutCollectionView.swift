//
//  NewWorkoutCollectionView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import UIKit

final class NewWorkoutCollectionView: UICollectionView {
    
    //MARK: - Properties
    private let collectionLayout = UICollectionViewFlowLayout()
    private let exercises = [UIImage(named: "default"),]
    
    //MARK: - Lifecycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegates()
        register(NewWorkoutCollectionViewCell.self, forCellWithReuseIdentifier: NewWorkoutCollectionViewCell.idNewWorkoutCell)
        selectItem(at: [0,0], animated: true, scrollPosition: [])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Methods
private extension NewWorkoutCollectionView {
    func setupLayout() {
        collectionLayout.minimumLineSpacing = 3
        collectionLayout.scrollDirection = .horizontal
    }
    
    func configure() {
        layer.cornerRadius = 10
        backgroundColor = .cellBackground
        showsHorizontalScrollIndicator = false
        bounces = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDelegates() {
        delegate = self
        dataSource = self
    }
}

//MARK: - UICollectionViewDataSource
extension NewWorkoutCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: NewWorkoutCollectionViewCell.idNewWorkoutCell, for: indexPath) as? NewWorkoutCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension NewWorkoutCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3.5,
               height: collectionView.frame.height)
    }
}

//MARK: - UICollectionViewDelegate
extension NewWorkoutCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect image")
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
