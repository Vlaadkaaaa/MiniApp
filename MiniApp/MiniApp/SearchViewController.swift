//
//  SearchViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit
/// Поиск товаров
final class SearchViewController: UIViewController {
    
    private enum Constants {
        static let searchTitle = "Поиск"
        static let searchBarPlaceholder = "Поиск по продуктам и магазинам"
        static let resentlyLabel = "Недавно просмотренные"
        static let clearTitle = "Очистить"
        static let oneItemImageName = "incaseFlat"
        static let twoItemImageName = "blackUnityStrap"
        static let threeItemImageName = "orangeLeatherCase"
        static let itemOneName = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let itemTwoName = "Спортивный ремешок Black Unity (для чего то там)"
        static let itemThreeName = "Кожанный чехол для MacBook Pro 16 дюймов"
        static let variantSearchLabel = "Варианты запросов"
        static let variantRequestOne = "AirPods"
        static let variantRequestTwo = "AppleCare"
        static let variantRequestThree = "Сравните модели iPhone"
        static let searchImageName = "magnifyingglass"
    }
    
    // MARK: - Private Visual Components
    private let searchTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 150, height: 30))
        label.text = Constants.searchTitle
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar(frame: CGRect(x: 10, y: 150, width: 350, height: 30))
        search.placeholder = Constants.searchBarPlaceholder
        search.barTintColor = .secondaryLabel
        search.tintColor = .white
        search.layer.cornerRadius = 10
        search.searchTextField.textColor = .systemGray
        return search
    }()
    
    private let recentlyTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 230, width: 300, height: 30))
        label.text = Constants.resentlyLabel
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let clearSearch: UIButton = {
        let button = UIButton(frame: CGRect(x: 280, y: 230, width: 100, height: 30))
        button.setTitle(Constants.clearTitle, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var oneBlockView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 280, width: 150, height: 200))
        view.tag = 0
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(handleTapGenture)))
        return view
    }()
    
    private lazy var twoBlockView: UIView = {
        let view = UIView(frame: CGRect(x: 170, y: 280, width: 150, height: 200))
        view.tag = 1
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(handleTapGenture)))
        return view
    }()
    
    private lazy var threeBlockView: UIView = {
        let view = UIView(frame: CGRect(x: 330, y: 280, width: 150, height: 200))
        view.tag = 2
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(handleTapGenture)))
        return view
    }()
    
    private let imageOne: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 30, y: 300, width: 110, height: 80))
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: Constants.oneItemImageName)
        return image
    }()
    
    private let oneItemName: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 395, width: 130, height: 80))
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = Constants.itemOneName
        
        return label
    }()
    
    private let imageTwo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 190, y: 300, width: 110, height: 80))
        image.image = UIImage(named: Constants.twoItemImageName)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let twoItemName: UILabel = {
        let label = UILabel(frame: CGRect(x: 180, y: 395, width: 130, height: 80))
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = Constants.itemTwoName
        
        return label
    }()
    
    private let imageThree: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 350, y: 300, width: 110, height: 80))
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: Constants.threeItemImageName)
        return image
    }()
    
    private let threeItemName: UILabel = {
        let label = UILabel(frame: CGRect(x: 340, y: 395, width: 130, height: 80))
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = Constants.itemThreeName
        return label
    }()
    
    private let variantRequestLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 520, width: 300, height: 30))
        label.text = Constants.variantSearchLabel
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let variantSearchImageOne: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 570, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.searchImageName)
        image.tintColor = .white
        return image
    }()
    
    private lazy var variantRequestLabelOne: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 565, width: 250, height: 30))
        label.text = Constants.variantRequestOne
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let variantSearchImageTwo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 620, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.searchImageName)
        image.tintColor = .white
        return image
    }()
    
    private lazy var variantRequestLabelTwo: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 615, width: 250, height: 30))
        label.text = Constants.variantRequestTwo
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let variantSearchImageThree: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 670, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.searchImageName)
        image.tintColor = .white
        return image
    }()
    
    private lazy var variantRequestLabelThree: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 665, width: 250, height: 30))
        label.text = Constants.variantRequestThree
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Method
    @objc private func handleTapGenture(sender: UITapGestureRecognizer) {
        switch sender.view?.tag {
        case 0: showDetailVC(image: Constants.oneItemImageName, title: Constants.itemOneName)
        case 1: showDetailVC(image: Constants.twoItemImageName, title: Constants.itemTwoName)
        case 2: showDetailVC(image: Constants.threeItemImageName, title: Constants.itemThreeName)
        default: break
        }
    }
    
    private func showDetailVC(image: String, title: String) {
        let detailsVC = DetaisViewController()
        detailsVC.label.text = title
        detailsVC.image.image = UIImage(named: image)
        present(detailsVC, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(searchTitle)
        view.addSubview(searchBar)
        view.addSubview(recentlyTitle)
        view.addSubview(clearSearch)
        view.addSubview(oneBlockView)
        view.addSubview(twoBlockView)
        view.addSubview(threeBlockView)
        view.addSubview(imageOne)
        view.addSubview(oneItemName)
        view.addSubview(imageTwo)
        view.addSubview(twoItemName)
        view.addSubview(imageThree)
        view.addSubview(threeItemName)
        view.addSubview(variantRequestLabel)
        view.addSubview(variantSearchImageOne)
        view.addSubview(variantRequestLabelOne)
        view.addSubview(variantRequestLabelTwo)
        view.addSubview(variantSearchImageTwo)
        view.addSubview(variantSearchImageThree)
        view.addSubview(variantRequestLabelThree)
    }
}
