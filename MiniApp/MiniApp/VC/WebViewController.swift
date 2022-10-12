//
//  WebViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 10.10.2022.
//

import UIKit
import WebKit
/// Внутренний браузер
final class WebViewController: UIViewController {
    
    // MARK: - Private Constants
    private enum Constants {
        static let urlReStore = "https://re-store.ru"
        static let urliPhone = "https://re-store.ru/catalog/10113256BLU/"
        static let urlWatch = "https://re-store.ru/catalog/MFAWSSL40DARKGREEN/"
        static let urlCase = "https://re-store.ru/catalog/INMB100649-BLK/"
        static let squareImage = "square.and.arrow.up"
        static let leftImage = "chevron.left"
        static let rightImage = "chevron.right"
        static let itemOneName = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let itemTwoName = "Спортивный ремешок Black Unity (для корпуса 44мм) размер R"
        static let itemThreeName = "Кожанный чехол для MacBook Pro 16 дюймов"
        static let itemFourName = "iPhone 13"
    }
    
    // MARK: - Public Property
    var itemName = ""
    var openDoc = ""
    
    // MARK: Private VisualComponents
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.frame = view.bounds
        webView.addSubview(toolBar)
        return webView
    }()
    
    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 720, width: 390, height: 60))
        toolBar.barTintColor = .secondaryLabel
        toolBar.setItems([
            goBackBarButton,
            goForwardBarButton,
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            customProgressBarButtonItem,
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            refreshPageBarButton,
            sharePageBarButton],
                         animated: false)
        toolBar.sizeToFit()
        return toolBar
    }()
    
    private lazy var progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.sizeToFit()
        progress.progressTintColor = .systemRed
        return progress
    }()
    
    private lazy var customProgressBarButtonItem: UIBarButtonItem = {
        let barItem = UIBarButtonItem(customView: progressView)
        return barItem
    }()
    
    private lazy var goBackBarButton: UIBarButtonItem = {
        let goBack = UIBarButtonItem(image: UIImage(systemName: Constants.leftImage),
                                     style: .plain, target: self, action: #selector(goAction))
        goBack.tag = 0
        return goBack
    }()
    
    private lazy var goForwardBarButton: UIBarButtonItem = {
        let goBack = UIBarButtonItem(image: UIImage(systemName: Constants.rightImage),
                                     style: .plain, target: self, action: #selector(goAction))
        goBack.tag = 1
        return goBack
    }()
    
    private lazy var refreshPageBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(goAction))
        barButton.tag = 2
        return barButton
    }()
    
    private lazy var sharePageBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: UIImage(systemName: Constants.squareImage),
                                        style: .plain, target: nil, action: nil)
        barButton.tag = 3
        return barButton
    }()
    
    // MARK: - Private Properties
    private var timer: Timer?
    
    // MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        checkLoadWebSite()
    }
    
    // MARK: - Private Method
    private func createTimerForProgressView() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: #selector(changeColorProgressViewAction), userInfo: nil, repeats: true)
    }
    @objc private func changeColorProgressViewAction() {
        if !webView.isLoading {
            timer?.invalidate()
            progressView.progressTintColor = .systemBlue
        } else {
            progressView.progressTintColor = .systemRed
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    private func loadWebSite(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    private func checkLoadWebSite() {
        if !openDoc.isEmpty {
            guard let request = Bundle.main.url(forResource: openDoc, withExtension: "pdf") else { return }
            webView.load(URLRequest(url: request))
        } else {
            switch itemName {
            case Constants.itemOneName: loadWebSite(urlString: Constants.urlCase)
            case Constants.itemTwoName: loadWebSite(urlString: Constants.urlWatch)
            case Constants.itemThreeName: loadWebSite(urlString: Constants.urlReStore)
            case Constants.itemFourName: loadWebSite(urlString: Constants.urliPhone)
            default: loadWebSite(urlString: Constants.urlReStore)
            }
        }
    }
    
    @objc private func goAction(sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            guard webView.canGoBack else { return }
            webView.goBack()
            createTimerForProgressView()
        case 1:
            guard webView.canGoForward else { return }
            webView.goForward()
            createTimerForProgressView()
        case 2:
            webView.reload()
            createTimerForProgressView()
        default:
            break
        }
    }
    private func setupUI() {
        view.backgroundColor = .white
        let viewElements: [UIView] = [webView, toolBar
        ]
        
        viewElements.forEach { view.addSubview($0) }
        createTimerForProgressView()
    }
}
