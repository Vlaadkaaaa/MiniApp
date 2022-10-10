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
        static let oneItemImageName = "case"
        static let twoItemImageName = "clock"
        static let threeItemImageName = "orangeCase"
        static let fourItemInageName = "iphone"
        static let itemOneName = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let itemTwoName = "Спортивный ремешок Black Unity (для корпуса 44мм) размер R"
        static let itemThreeName = "Кожанный чехол для MacBook Pro 16 дюймов"
        static let itemFourName = "iPhone 13"
        static let variantSearchLabel = "Варианты запросов"
        static let variantRequestOne = "AirPods"
        static let variantRequestTwo = "AppleCare"
        static let variantRequestThree = "Beats"
        static let variantRequestFour = "Сравните модели iPhone"
        static let searchImageName = "magnifyingglass"
    }
    
    // MARK: - Private Visual Components
    private lazy var imageItemScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 250, width: view.bounds.width, height: 180))
        scrollView.isPagingEnabled = false
        scrollView.contentSize = CGSize(width: 610, height: 180)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(oneBlockView)
        scrollView.addSubview(twoBlockView)
        scrollView.addSubview(threeBlockView)
        scrollView.addSubview(fourBlockView)
        return scrollView
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 80, width: 150, height: 30))
        label.text = Constants.searchTitle
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar(frame: CGRect(x: 5, y: 130, width: 380, height: 30))
        search.placeholder = Constants.searchBarPlaceholder
        search.layer.cornerRadius = 10
        search.barTintColor = .black
        
        return search
    }()
    
    private let recentlyTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 200, width: 300, height: 30))
        label.text = Constants.resentlyLabel
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 21)
        return label
    }()
    
    private let clearSearchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 280, y: 200, width: 100, height: 30))
        button.setTitle(Constants.clearTitle, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var oneBlockView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 0, width: 135, height: 180))
        view.tag = 0
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(handleTapGentureAction)))
        view.addSubview(imageOneView)
        view.addSubview(oneItemLabel)
        return view
    }()
    
    private lazy var twoBlockView: UIView = {
        let view = UIView(frame: CGRect(x: 160, y: 0, width: 135, height: 180))
        view.tag = 1
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(handleTapGentureAction)))
        view.addSubview(imageTwoView)
        view.addSubview(twoItemLabel)
        return view
    }()
    
    private lazy var threeBlockView: UIView = {
        let view = UIView(frame: CGRect(x: 310, y: 0, width: 135, height: 180))
        view.tag = 2
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(handleTapGentureAction)))
        view.addSubview(imageThreeView)
        view.addSubview(threeItemLabel)
        return view
    }()
    
    private lazy var fourBlockView: UIView = {
        let view = UIView(frame: CGRect(x: 460, y: 0, width: 135, height: 180))
        view.tag = 3
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(handleTapGentureAction)))
        view.addSubview(imageFourView)
        view.addSubview(fourItemLabel)
        return view
    }()
    
    private let imageOneView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 20, width: 105, height: 90))
        image.image = UIImage(named: Constants.oneItemImageName)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let oneItemLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 110, width: 120, height: 70))
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        label.text = Constants.itemOneName
        
        return label
    }()
    
    private let imageTwoView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 20, width: 105, height: 90))
        image.image = UIImage(named: Constants.twoItemImageName)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let twoItemLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 110, width: 120, height: 70))
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        label.text = Constants.itemTwoName
        
        return label
    }()
    
    private let imageThreeView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 20, width: 105, height: 90))
        image.image = UIImage(named: Constants.threeItemImageName)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let fourItemLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 110, width: 120, height: 70))
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        label.text = Constants.itemFourName
        return label
    }()
    
    private let imageFourView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 20, width: 105, height: 90))
        image.image = UIImage(named: Constants.fourItemInageName)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let threeItemLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 110, width: 120, height: 70))
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        label.text = Constants.itemThreeName
        return label
    }()
    
    private let variantRequestLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 480, width: 300, height: 30))
        label.text = Constants.variantSearchLabel
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let variantSearchImageOne: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 530, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.searchImageName)
        image.tintColor = .darkGray
        return image
    }()
    
    private lazy var variantRequestLabelOne: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 525, width: 250, height: 30))
        label.text = Constants.variantRequestOne
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20)
        view.addSubview(addViewLine(yCor: 565))
        return label
    }()
    
    private let variantSearchImageTwo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 580, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.searchImageName)
        image.tintColor = .darkGray
        return image
    }()
    
    private lazy var variantRequestLabelTwo: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 575, width: 250, height: 30))
        label.text = Constants.variantRequestTwo
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20)
        view.addSubview(addViewLine(yCor: 615))
        return label
    }()
    
    private let variantSearchImageThree: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 630, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.searchImageName)
        image.tintColor = .darkGray
        return image
    }()
    
    private lazy var variantRequestLabelThree: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 625, width: 250, height: 30))
        label.text = Constants.variantRequestThree
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20)
        view.addSubview(addViewLine(yCor: 665))
        return label
    }()
    
    private let variantSearchImageFour: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 680, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.searchImageName)
        image.tintColor = .darkGray
        return image
    }()
    
    private lazy var variantRequestLabelFour: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 675, width: 250, height: 30))
        label.text = Constants.variantRequestFour
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20)
        view.addSubview(addViewLine(yCor: 715))
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // MARK: - Private Method
    @objc private func handleTapGentureAction(sender: UITapGestureRecognizer) {
        let constants = [(Constants.oneItemImageName, Constants.itemOneName),
                         (Constants.twoItemImageName, Constants.itemTwoName),
                         (Constants.threeItemImageName, Constants.itemThreeName),
                         (Constants.fourItemInageName, Constants.itemFourName)]
        guard let tag = sender.view?.tag else { return }
        showDetailVC(image: constants[tag].0, title: constants[tag].1)
    }
    
    private func showDetailVC(image: String, title: String) {
        let detailsVC = DetaisViewController()
        detailsVC.productName = title
        detailsVC.productImage = image
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    private func addViewLine(yCor: Double) -> UIView {
        let view = UIView(frame: CGRect(x: 10, y: yCor, width: 370, height: 0.7))
        view.backgroundColor = .secondaryLabel
        return view
    }
    
    private func setupUI() {
        title = Constants.searchTitle
        view.addSubview(imageItemScrollView)
        view.addSubview(searchLabel)
        view.addSubview(searchBar)
        view.addSubview(recentlyTitle)
        view.addSubview(clearSearchButton)
        view.addSubview(variantRequestLabel)
        view.addSubview(variantSearchImageOne)
        view.addSubview(variantRequestLabelOne)
        view.addSubview(variantRequestLabelTwo)
        view.addSubview(variantSearchImageTwo)
        view.addSubview(variantSearchImageThree)
        view.addSubview(variantRequestLabelThree)
        view.addSubview(variantRequestLabelFour)
        view.addSubview(variantSearchImageFour)
    }
}
