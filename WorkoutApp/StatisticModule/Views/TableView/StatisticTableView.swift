//
//  StatisticTableView.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

final class StatisticTableView: UITableView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(StatisticTableViewCell.self, forCellReuseIdentifier: StatisticTableViewCell.idStatisticTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Methods
private extension StatisticTableView {
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
extension StatisticTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: StatisticTableViewCell.idStatisticTableViewCell, for: indexPath) as? StatisticTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension StatisticTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
