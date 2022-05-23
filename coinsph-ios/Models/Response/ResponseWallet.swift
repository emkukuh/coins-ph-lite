//
//  ResponseWallet.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import ObjectMapper

struct ResponseWallet: Mappable {
    var wallets: [Wallet] = []

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        wallets <- map["wallets"]
    }
}
