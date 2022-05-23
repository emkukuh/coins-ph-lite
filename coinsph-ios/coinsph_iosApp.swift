//
//  coinsph_iosApp.swift
//  coinsph-ios
//
//  Created by kukuh on 20/05/22.
//

import SwiftUI

@main
struct coinsph_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            HomeCoordinator()
        }
    }
}
