//
//  MainTabBarController.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 18.12.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
}

//MARK: - Private Methods
private extension MainTabBarController {
    func setupTabBar() {
        tabBar.backgroundColor = .tabBar
        tabBar.tintColor = .mainDarkGreen
        tabBar.unselectedItemTintColor = .mainLabel
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.tabBarBorder.cgColor
    }
    
    func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        setViewControllers([mainVC, statisticVC], animated: true)
        
        //TODO: - optimize via cycle
        guard let items = tabBar.items else { return }
        items[0].title = "Main"
        items[1].title = "Statistic"
        
        items[0].image = UIImage(named: "mainTabBar")
        items[1].image = UIImage(named: "statisticTabBar")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.robotoBold12() as Any], for: .normal)
    }
    
}
