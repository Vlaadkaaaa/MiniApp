//
//  ForYouViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit
/// Для вас
final class ForYouViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: Private Enum Constant
    private enum Constant {
        static let forYouTitle = "Для вас"
        static let avatarImageName = "avatar"
        static let whatIsNewTitle = "Вот что нового"
        static let recommendedForYouTitle = "Рекомендуется вам"
        static let orderStatusTitle = "Ваш заказ отправлен."
        static let deliveryItemCountTitle = "1 товар, доставка завтра"
        static let deliveryStatusOneTitle = "Обрабатывается"
        static let deliveryStatusTwoTitle = "Отправлено"
        static let deliveryStatusThreeTite = "Доставлено"
        static let recommendedOneTitle = "Получайте новости о своем заказе в режиме реального времени."
        static let recommendedTwoTitle = "Включите уведомления, чтобы получать новости о своем заказе."
        static let yourDevicesLabelTitle = "Ваши устройства"
        static let yourDevicesButtonTitle = "Показать все"
        static let squareImageName = "square"
        static let appleAirdropImageName = "apple-airpod"
    }
    
    // MARK: Private VisualComponent
    private lazy var avatarView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.addSubview(avatarButton)
        return view
    }()
    
    private lazy var avatarButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 40, width: 50, height: 50))
        button.setImage(UIImage(named: Constant.avatarImageName), for: .normal)
        button.addTarget(self, action: #selector(setupAvatarAction), for: .allTouchEvents)
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 40)
        
        let viewElements: [UIView] = [
            whatIsNewLabel, deliveryStatusView, recommendedYouLabel,
            recommendedYouView, yourDevicesLabel, yourDevicesButton]
        
        viewElements.forEach { scrollView.addSubview($0) }
        return scrollView
    }()
    
    private let whatIsNewLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 30, width: 250, height: 30))
        label.text = Constant.whatIsNewTitle
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private lazy var deliveryStatusView: UIView = {
        let view = UIView(frame: CGRect(x: 15, y: 90, width: 360, height: 150))
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.2
        view.layer.cornerRadius = 10
        view.addSubview(addLineView(frame: CGRect(x: 0, y: 85, width: 360, height: 2)))
        
        let deliveryItems = [
            itemImageView, orderStatusLabel, deliveryItemCountLabel,
            deliveryProgressView, deliveryStatusOneLabel, deliveryStatusTwoLabel, deliveryStatusThreeLabel]
        
        deliveryItems.forEach { view.addSubview($0)}
        return view
    }()
    
    private let orderStatusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 10, width: 250, height: 20))
        label.text = Constant.orderStatusTitle
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let deliveryItemCountLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 35, width: 250, height: 20))
        label.text = Constant.deliveryItemCountTitle
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let deliveryProgressView: UIProgressView = {
        let progressView = UIProgressView(frame: CGRect(x: 5, y: 100, width: 350, height: 30))
        progressView.progress = 0.5
        progressView.progressTintColor = .green
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 2)
        return progressView
    }()
    
    private let deliveryStatusOneLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 5, y: 115, width: 150, height: 20))
        label.text = Constant.deliveryStatusOneTitle
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    private let deliveryStatusTwoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 145, y: 115, width: 120, height: 20))
        label.text = Constant.deliveryStatusTwoTitle
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    private let deliveryStatusThreeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 270, y: 115, width: 100, height: 20))
        label.text = Constant.deliveryStatusThreeTite
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let itemImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))
        itemImageView.image = UIImage(named: Constant.appleAirdropImageName)
        return itemImageView
    }()
    
    private let recommendedYouLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 330, width: 350, height: 30))
        label.text = Constant.recommendedForYouTitle
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var recommendedYouView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 380, width: 350, height: 150))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: 45, height: 45))
        imageView.image = UIImage(named: Constant.squareImageName)
        
        let label = UILabel(frame: CGRect(x: 60, y: 20, width: 230, height: 60))
        label.numberOfLines = 3
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.text = Constant.recommendedOneTitle
        
        let labelTwo = UILabel(frame: CGRect(x: 60, y: 80, width: 300, height: 50))
        labelTwo.numberOfLines = 2
        labelTwo.font = .boldSystemFont(ofSize: 14)
        labelTwo.textColor = .gray
        labelTwo.text = Constant.recommendedTwoTitle
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(labelTwo)
        view.addSubview(addLineView(frame: CGRect(x: 0, y: 148, width: 390, height: 2)))
        return view
    }()
    
    private let yourDevicesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 550, width: 300, height: 30))
        label.font = .boldSystemFont(ofSize: 24)
        label.text = Constant.yourDevicesLabelTitle
        return label
    }()
    
    private lazy var yourDevicesButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 265,
                                            y: 555, width: 120, height: 30))
        button.setTitle(Constant.yourDevicesButtonTitle, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    // MARK: - Life Cucle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constant.forYouTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: avatarView)
    }
    
    private func addLineView(frame: CGRect) -> UIView {
        let lineView = UIView(frame: frame)
        lineView.backgroundColor = .systemGray5
        return lineView
    }
    
    @objc private func setupAvatarAction() {
        let imagePC = UIImagePickerController()
        imagePC.delegate = self
        imagePC.allowsEditing = true
        present(imagePC, animated: true)
    }
}

extension ForYouViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image =  info[.editedImage] as? UIImage else { return }
        let img = image.resizeImage(to: CGSize(width: 30, height: 30))
        avatarButton.setImage(img, for: .normal)
        dismiss(animated: true)
    }
}

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
