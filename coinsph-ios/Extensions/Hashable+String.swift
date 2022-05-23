//
//  Hashable+String.swift
//  coinsph-ios
//
//  Created by kukuh on 21/05/22.
//

import Foundation

extension Hashable {
    var toString: String {
        String(describing: self)
    }
}
