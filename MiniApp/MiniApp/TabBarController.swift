//
//  ViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private enum Constants {
        static let titleBuy = "Купить"
        static let titleForYou = "Для вас"
        static let titleSearch = "Поиск"
        static let titleBasket = "Корзина"
    }
    
    // MARK: Private Constant
    private let buyVC = BuyViewController()
    private let forYouVC = ForYouViewController()
    private let searchVC = SearchViewController()
    private let basketVC = BasketViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func changedColor() {
        tabBar.backgroundColor = .secondaryLabel
        tabBar.barTintColor = .white
    }
    
    // MARK: Private Method
    private func setupUI() {
        changedColor()
        let navController = UINavigationController(rootViewController: searchVC)
        self.setViewControllers([buyVC, forYouVC, navController, basketVC], animated: true)
        buyVC.tabBarItem = UITabBarItem(title: Constants.titleBuy,
                                        image: UIImage(systemName: "laptopcomputer.and.iphone"), tag: 0)
        forYouVC.tabBarItem = UITabBarItem(title: Constants.titleForYou,
                                           image: UIImage(systemName: "person.crop.circle"), tag: 1)
        searchVC.tabBarItem = UITabBarItem(title: Constants.titleSearch,
                                           image: UIImage(systemName: "magnifyingglass"), tag: 2)
        basketVC.tabBarItem = UITabBarItem(title: Constants.titleBasket, image: UIImage(systemName: "bag"), tag: 3)
    }
}
