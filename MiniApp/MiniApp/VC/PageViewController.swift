//
//  PageViewController.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 14.10.2022.
//

import UIKit

/// Определяет какая страница будет загружена в данный момент
final class PageViewController: UIPageViewController {
    
    // MARK: - Private Constants
    private enum Constants {
        static let pageOneImageName = "page1"
        static let pageTwoImageName = "page2"
        static let pageThreeImageName = "page3"
        static let titlePageOneText = "Track Your Cycle"
        static let subTitlePageOneText = "Manage irregular period and learn how to improve your period"
        static let titlePageTwoText = "Plan Your Pregnancy"
        static let subTitlePageTwoText = "Favorable days importmant. " +
        "Vestibulum ruturum quam vitae fringila tincidunt."
        static let titlePageThreeText = "Daily Health Insight"
        static let subTitlePageThreeText = "Personal health insight. Vestibulum rutrum quam " +
        "vitae fringilla tincidunt."
        static let skibButtonTitle = "Skip"
        static let nextButtonTitle = "Next"
        static let getStartedButtonTitle = "Get started!"
        static let keyForUserDefaulys = "true"
    }
    
    // MARK: Private Visual Component
    private lazy var skipButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 35, y: view.frame.height - 60, width: 100, height: 30))
        button.setTitle(Constants.skibButtonTitle, for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.tag = 0
        button.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 255, y: view.frame.height - 60, width: 100, height: 30))
        button.setTitle(Constants.nextButtonTitle, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 120, y: view.frame.height - 70, width: 130, height: 40))
        button.isHidden = true
        button.setTitle(Constants.getStartedButtonTitle, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(showNewVCAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Private Properties
    private let myPageControl = UIPageControl()
    private let pageControlAppearance = UIPageControl.appearance()
    private lazy var pagesViewController: [VCForPageViewController] = {
        var pages: [VCForPageViewController] = []
        guard let pageOne = UIImage(named: Constants.pageOneImageName),
              let pageTwo = UIImage(named: Constants.pageTwoImageName),
              let pageThree = UIImage(named: Constants.pageThreeImageName) else {
            return pages
        }
        let firstPage = PageHelper(image: pageOne, title: Constants.titlePageOneText,
                                   subTitle: Constants.subTitlePageOneText)
        let secondPage = PageHelper(image: pageTwo, title: Constants.titlePageTwoText,
                                    subTitle: Constants.subTitlePageTwoText)
        let lastPage = PageHelper(image: pageThree, title: Constants.titlePageThreeText,
                                  subTitle: Constants.subTitlePageThreeText)
        
        pages.append(VCForPageViewController(pageWith: firstPage))
        pages.append(VCForPageViewController(pageWith: secondPage))
        pages.append(VCForPageViewController(pageWith: lastPage))
        return pages
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Override init
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        delegate = self
        dataSource = self
        setViewControllers([pagesViewController[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(getStartedButton)
        pageControlAppearance.pageIndicatorTintColor = .gray
        pageControlAppearance.currentPageIndicatorTintColor = .systemBlue
    }
    
    private func hidenPageElement(isHidden: Bool) {
        skipButton.isHidden = isHidden
        nextButton.isHidden = isHidden
        pageControl?.isHidden = isHidden
        getStartedButton.isHidden = !isHidden
    }
    
    @objc private func showNewVCAction() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(Constants.keyForUserDefaulys, forKey: Constants.keyForUserDefaulys)
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func skipAction() {
        guard let currenPage = pageControl?.currentPage else { return }
        let nextPage = currenPage - 1
        guard nextPage >= 0 else { return }
        setViewControllers([pagesViewController[nextPage]], direction: .reverse, animated: true)
        pageControl?.currentPage = nextPage
    }
    
    @objc private func nextAction() {
        guard let currenPage = pageControl?.currentPage else { return }
        let nextPage = currenPage + 1
        guard nextPage <= pagesViewController.count - 1 else { return }
        setViewControllers([pagesViewController[nextPage]], direction: .forward, animated: true)
        pageControl?.currentPage = nextPage
        if pageControl?.currentPage == 2 {
            hidenPageElement(isHidden: true)
        }
    }
}

// MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? VCForPageViewController else { return nil }
        if let index = pagesViewController.firstIndex(of: viewController) {
            if index < pagesViewController.count - 1 {
                hidenPageElement(isHidden: false)
            }
            if index > 0 {
                return pagesViewController[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? VCForPageViewController else { return nil }
        
        if let index = pagesViewController.firstIndex(of: viewController) {
            
            let lastPage = pagesViewController.count - 1
            if index < lastPage {
                
                return pagesViewController[index + 1]
            }
        }
        return nil
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pagesViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let pageControl = pageControl?.currentPage else { return }
        if pageControl == 2 {
            hidenPageElement(isHidden: true)
        } else {
            hidenPageElement(isHidden: false)
        }
    }
}
