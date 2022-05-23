//
//  String+Currency.swift
//  coinsph-ios
//
//  Created by kukuh on 23/05/22.
//

import Foundation

extension String {
    func withCurrency(_ currency: String) -> String {
        return "\(self) \(currency)"
    }
}
