//
//  Wallet.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import ObjectMapper

struct Wallet {
    var id: String = DefaultValues.string
    var walletName: String = DefaultValues.string
    var balance: String = DefaultValues.string
}

extension Wallet: Mappable {
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        walletName <- map["wallet_name"]
        balance <- map["balance"]
    }
}
