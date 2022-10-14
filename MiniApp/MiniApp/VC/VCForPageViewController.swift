//
//  VCForPageViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 14.10.2022.
//

import UIKit
/// Контроллер отображения страниц
final class VCForPageViewController: UIViewController {
    
    // MARK: - Private Constants
    private enum Constants {
        static let fontDidotName = "Didot"
        static let fontDidotBoldName = "Didot-Bold"
    }
    
    // MARK: Private Visual Components
    private let pageImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 100, width: 390, height: 400)
        return image
    }()
    
    private let titleTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 520, width: 300, height: 45))
        label.font = UIFont(name: Constants.fontDidotBoldName, size: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let subTitleTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 575, width: 320, height: 50))
        label.font = UIFont(name: Constants.fontDidotName, size: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .gray
        return label
    }()
    
    // MARK: Init
    init(pageWith: PageHelper) {
        super.init(nibName: nil, bundle: nil)
        edgesForExtendedLayout = []
        pageImageView.image = pageWith.image
        titleTextLabel.text = pageWith.titleLabel
        subTitleTextLabel.text = pageWith.subTitleLabel
        
        view.addSubview(pageImageView)
        view.addSubview(titleTextLabel)
        view.addSubview(subTitleTextLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        endLoadAlphaText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startLoadAlphaText()
    }
    
    // MARK: Private Methods
    private func startLoadAlphaText() {
        UILabel.animate(withDuration: 1) {
            self.titleTextLabel.alpha = 1
            self.subTitleTextLabel.alpha = 1
        }
    }
    
    private func endLoadAlphaText() {
        UILabel.animate(withDuration: 0) {
            self.titleTextLabel.alpha = 0
            self.subTitleTextLabel.alpha = 0
        }
    }
}
