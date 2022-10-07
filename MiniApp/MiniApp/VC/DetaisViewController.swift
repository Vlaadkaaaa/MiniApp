//
//  DetaisViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit
/// Подробнее о выбранном товаре
final class DetaisViewController: UIViewController {
    
    // MARK: - Visual Component
    var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 95, y: 130, width: 200, height: 200))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Вынесу в отдельный метод в 17ом уроке
        view.addSubview(label)
        view.addSubview(image)
        view.backgroundColor = .black
    }
}