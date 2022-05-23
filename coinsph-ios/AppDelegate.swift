//
//  AppDelegate.swift
//  coinsph-ios
//
//  Created by kukuh on 21/05/22.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        setupNavigationBar()
        return true
    }

    private func setupNavigationBar() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
    }
}
