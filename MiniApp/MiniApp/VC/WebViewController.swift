//
//  WebViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 10.10.2022.
//

import UIKit
import WebKit
/// Внутренний браузер
class WebViewController: UIViewController {
    private enum Constants {
        static let urlReStore = "https://re-store.ru"
        static let urliPhone = "https://re-store.ru/catalog/10113256BLU/"
        static let urlWatch = "https://re-store.ru/catalog/MFAWSSL40DARKGREEN/"
        static let urlCase = "https://re-store.ru/catalog/INMB100649-BLK/"
    }
    
    private lazy var webView: WKWebView = {
       let webView = WKWebView()
        webView.frame = view.bounds
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebSite(urlString: Constants.urlReStore)
        setupUI()
    }

    private func loadWebSite(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let viewElements: [UIView] = [webView
        ]
        
        viewElements.forEach { view.addSubview($0) }
    }
}
