//
//  UINavigationController+SwipeRight.swift
//  MovieApp
//
//  Created by Desu Miko on 03.03.2021.
//

import Foundation
import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.hidesBarsOnTap = true
        UINavigationBar.appearance().barTintColor = UIColor(Color("bg"))
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
