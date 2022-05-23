//
//  AppStateDebug.swift
//  coinsph-ios
//
//  Created by kukuh on 23/05/22.
//

import Foundation

class AppStateDebug: ObservableObject {
    static let shared = AppStateDebug()
    @Published var isErrorDebug: Bool = false
    
    private init() {}
}
