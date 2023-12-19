//
//  MainTableView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

final class MainTableView: UITableView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Methods
private extension MainTableView {
    func configure() {
        backgroundColor = .none
        separatorStyle = .none
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDelegates() {
        delegate = self
        dataSource = self
    }
}

//MARK: - UITableViewDataSource
extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
