//
//  DetaisViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 06.10.2022.
//

import UIKit
///
final class DetaisViewController: UIViewController {
    
     var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 10, width: 200, height: 30))
         label.textColor = .blue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .white
    }
    
}
