//
//  UIExtension.swift
//  MiniApp
//
//  Created by Владислав Лымарь on 14.10.2022.
//

import UIKit

extension UIPageViewController {
    var pageControl: UIPageControl? {
        for view in view.subviews where view is UIPageControl {
            return view as? UIPageControl
        }
        return nil
    }
}
