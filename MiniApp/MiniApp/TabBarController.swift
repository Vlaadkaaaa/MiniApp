//
//  ViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let buyVC = BuyViewController()
    private let forYouVC = ForYouViewController()
    private let searchVC = SearchViewController()
    private let basketVC = BasketViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tabBar.backgroundColor = .secondaryLabel
        tabBar.barTintColor = .white
        setupUI()
    }
    func setupUI() {
        let navController = UINavigationController(rootViewController: searchVC)
        self.setViewControllers([buyVC, forYouVC, navController, basketVC], animated: true)
        buyVC.tabBarItem = UITabBarItem(title: "Купить",
                                        image: UIImage(systemName: "laptopcomputer.and.iphone"), tag: 0)
        forYouVC.tabBarItem = UITabBarItem(title: "Для вас",
                                           image: UIImage(systemName: "person.crop.circle"), tag: 1)
        searchVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "bag"), tag: 3)
    }
}
