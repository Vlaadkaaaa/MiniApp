//
//  DetaisViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit
/// Подробнее о выбранном товаре
final class DetaisViewController: UIViewController {
    // MARK: PRivate Constants
    private enum Constants {
        static let productPrice = "3 900.00 руб."
        static let compatibleWith = "Совместимо с "
        static let compatibleMacName = "MacBook Air — Vladka"
        static let countItem =  "Введите количество товароа"
        static let titleButton = "Добавить в корзину"
        static let openDocName = "doc"
        static let checkmarkImageName = "checkmark.circle.fill"
        static let otherTextOne = "Заказ сегодня в течении дня, доставка:"
        static let otherTextTwo = "Чт 13 октября - Бесплатно"
        static let otherTextThree = "Варианты доставки до местоположения: 115533"
        static let shippingboxName = "shippingbox"
        static let heartImageName = "heart"
    }
    
    // MARK: - Public Properties
    var productImage = ""
    var productName = ""
    
    // MARK: - Visual Component
    private lazy var imageScrollView: UIScrollView = {
        var scrollView = UIScrollView(frame: CGRect(x: 0, y: 170, width: 390, height: 250))
        scrollView.contentSize = CGSize(width: 390 * 3, height: 250)
        scrollView.isPagingEnabled = true
        scrollView.indicatorStyle = .white
        scrollView.addSubview(productImageOne)
        scrollView.addSubview(productImageTwo)
        scrollView.addSubview(productImageThree)
        return scrollView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 95, width: 370, height: 50))
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        label.text = productName
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 135, y: 135, width: 120, height: 30))
        label.text = Constants.productPrice
        label.textAlignment = .center
        
        label.textColor = .gray
        return label
    }()
    
    private lazy var productImageOne: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 70, y: 20, width: 250, height: 200))
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: productImage)
        return image
    }()
    private lazy var productImageTwo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 460, y: 20, width: 250, height: 200))
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: productImage + "2")
        return image
    }()
    private lazy var productImageThree: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 850, y: 20, width: 250, height: 200))
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: productImage + "3")
        return image
    }()
    
    private lazy var descriptionProdctLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 435, width: 350, height: 20))
        label.text = productName
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11)
        label.textColor = .gray
        return label
    }()
    
    private lazy var chooseOneButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 155, y: 470, width: 35, height: 35))
        button.tag = 0
        var config = UIButton.Configuration.borderless()
        config.cornerStyle = .capsule
        config.background.strokeColor = .black
        config.background.strokeWidth = 3
        config.background.backgroundColor = .lightGray
        button.configuration = config
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowRadius = 0
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(chooseItemColorAction), for: .allTouchEvents)
        return button
    }()
    
    private lazy var chooseTwoButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200, y: 470, width: 35, height: 35))
        button.tag = 1
        var config = UIButton.Configuration.borderless()
        config.cornerStyle = .capsule
        config.background.strokeColor = .black
        config.background.strokeWidth = 3
        config.background.backgroundColor = .darkGray
        button.configuration = config
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(chooseItemColorAction), for: .allTouchEvents)
        
        return button
    }()
    
    private let checkmarkImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 75, y: 530, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.checkmarkImageName)
        image.tintColor = .green
        return image
    }()
    
    private let compatibleWithLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 530, width: 90, height: 20))
        label.text = Constants.compatibleWith
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let compatibleMacNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 190, y: 530, width: 150, height: 20))
        label.text = Constants.compatibleMacName
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let countItemLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 580, width: 330, height: 25))
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = Constants.countItem
        return label
    }()
    
    private let countItemTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 250, y: 580, width: 50, height: 25))
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let openDocButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 315, y: 580, width: 25, height: 25))
        button.setImage(UIImage(systemName: Constants.openDocName), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let addToBasketButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 625, width: 350, height: 40))
        button.backgroundColor = .systemBlue
        button.setTitle(Constants.titleButton, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let shipingboxImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 20, y: 690, width: 20, height: 20))
        image.image = UIImage(systemName: Constants.shippingboxName)
        image.tintColor = .gray
        return image
    }()
    private let otherOneTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 690, width: 300, height: 15))
        label.text = Constants.otherTextOne
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 11)
        return label
    }()
    
    private let otherTwoTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 705, width: 300, height: 15))
        label.text = Constants.otherTextTwo
        label.textColor = .gray
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    private let otherThreeTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 720, width: 310, height: 15))
        label.text = Constants.otherTextThree
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    // MARK: - Life Cucle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Private Methods
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(imageScrollView)
        view.addSubview(productNameLabel)
        view.addSubview(productPriceLabel)
        view.addSubview(descriptionProdctLabel)
        view.addSubview(chooseOneButton)
        view.addSubview(chooseTwoButton)
        view.addSubview(checkmarkImageView)
        view.addSubview(compatibleWithLabel)
        view.addSubview(compatibleMacNameLabel)
        view.addSubview(countItemLabel)
        view.addSubview(countItemTextField)
        view.addSubview(openDocButton)
        view.addSubview(addToBasketButton)
        view.addSubview(shipingboxImageView)
        view.addSubview(otherOneTextLabel)
        view.addSubview(otherTwoTextLabel)
        view.addSubview(otherThreeTextLabel)
        addRightBarItem()
    }
    
    private func addRightBarItem() {
        let shareButton = UIBarButtonItem(systemItem: .action)
        let heartButton = UIBarButtonItem(image: UIImage(systemName: Constants.heartImageName),
                                          style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [heartButton, shareButton]
    }
    
    @objc private func chooseItemColorAction(sender: UIButton) {
        chooseOneButton.layer.shadowRadius = sender === chooseOneButton ? 3 : 0
        chooseTwoButton.layer.shadowRadius = sender === chooseTwoButton ? 3 : 0
    }
}
