//
//  SearchViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit
///
final class SearchViewController: UIViewController {
    private let searchLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 150, height: 30))
        label.text = "Поиск"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar(frame: CGRect(x: 10, y: 150, width: 350, height: 30))
        search.placeholder = "Поиск по продуктам и магазинам"
        search.barTintColor = .secondaryLabel
        search.tintColor = .white
        search.layer.cornerRadius = 10
        search.searchTextField.textColor = .systemGray
        return search
    }()
    
    private let recentlyLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 230, width: 300, height: 30))
        label.text = "Недавно просмотренные"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let clearSearchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 280, y: 230, width: 100, height: 30))
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    private let oneView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 280, width: 150, height: 200))
        view.tag = 0
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        return view
    }()
    private let twoView: UIView = {
        let view = UIView(frame: CGRect(x: 170, y: 280, width: 150, height: 200))
        view.tag = 1
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        return view
    }()
    private let threeView: UIView = {
        let view = UIView(frame: CGRect(x: 330, y: 280, width: 150, height: 200))
        view.tag = 2
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondaryLabel
        return view
    }()
    
    private let imageOne: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 30, y: 300, width: 110, height: 80))
        image.contentMode = .scaleAspectFit
        
        image.image = UIImage(named: "Image")
        return image
    }()
    private let textViewOne: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 395, width: 130, height: 80))
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        
        return label
    }()
    private let imageTwo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 190, y: 300, width: 110, height: 80))
        image.image = UIImage(named: "4")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let textViewTwo: UILabel = {
        let label = UILabel(frame: CGRect(x: 180, y: 395, width: 130, height: 80))
        label.numberOfLines = 3
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = "Спортивный ремешок Black Unity (для чего то там)"
        
        return label
    }()
    private let imageThree: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 350, y: 300, width: 110, height: 80))
        image.contentMode = .scaleAspectFill
        
        image.image = UIImage(named: "2")
        return image
    }()
    private let textViewThree: UILabel = {
        let label = UILabel(frame: CGRect(x: 340, y: 395, width: 130, height: 80))
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = "Кожанный чехол для MacBook Pro 16 дюймов"
        
        return label
    }()
    private let variantRequestLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 520, width: 300, height: 30))
        label.text = "Варианты запросов"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    private let variantSearchImageOne: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 570, width: 20, height: 20))
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .white
        return image
    }()
    private lazy var variantRequestLabelOne: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 565, width: 250, height: 30))
        label.text = "AirPods"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private let variantSearchImageTwo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 620, width: 20, height: 20))
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .white
        return image
    }()
    private lazy var variantRequestLabelTwo: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 615, width: 250, height: 30))
        
        label.text = "AppleCare"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let variantSearchImageThree: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 670, width: 20, height: 20))
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .white
        return image
    }()
    private lazy var variantRequestLabelThree: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 665, width: 250, height: 30))
        
        label.text = "Сравните модели iPhone"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let tapRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc private func handleTapGenture(sender: UITapGestureRecognizer) {
       
    }
    private func showVC() {
        let detailsVC = DetaisViewController()
        detailsVC.label.text = "Hello"
        present(detailsVC, animated: true)
    }
    private func setupUI() {
        view.addSubview(searchLabel)
        view.addSubview(searchBar)
        view.addSubview(recentlyLabel)
        view.addSubview(clearSearchButton)
        view.addSubview(oneView)
        view.addSubview(twoView)
        view.addSubview(threeView)
        view.addSubview(imageOne)
        view.addSubview(textViewOne)
        
        view.addSubview(imageTwo)
        view.addSubview(textViewTwo)
        
        view.addSubview(imageThree)
        view.addSubview(textViewThree)
        
        view.addSubview(variantRequestLabel)
        
        view.addSubview(variantSearchImageOne)
        view.addSubview(variantRequestLabelOne)
        view.addSubview(variantRequestLabelTwo)
        view.addSubview(variantSearchImageTwo)
        view.addSubview(variantSearchImageThree)
        view.addSubview(variantRequestLabelThree)
        
        tapRecognizer.addTarget(self, action: #selector(handleTapGenture))
        
        view.addGestureRecognizer(tapRecognizer)
    }
}
