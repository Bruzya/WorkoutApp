//
//  UIMainTableViewCell.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    //MARK: - UI
     private let backgroundCell: UIView = {
        let view = UIView()
         view.layer.cornerRadius = 20
         view.backgroundColor = UIColor.subLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutBackgroundView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.mainBackground
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
    
    private let workoutImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "testWorkout")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    //MARK: - Properties
    
    
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
private extension MainTableViewCell {
    func setupViews() {
        
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            
        ])
    }
}
