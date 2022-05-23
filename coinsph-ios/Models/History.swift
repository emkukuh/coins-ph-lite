//
//  History.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import ObjectMapper

struct History {
    var id: String = DefaultValues.string
    var entry: HistoryEntry = .incoming
    var amount: String = DefaultValues.string
    var currency: String = DefaultValues.string
    var sender: String = DefaultValues.string
    var recipient: String = DefaultValues.string
}

extension History: Mappable {
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        entry <- map["entry"]
        amount <- map["amount"]
        currency <- map["currency"]
        sender <- map["sender"]
        recipient <- map["recipient"]
    }
}

extension Array where Element == History {
    func findById(_ id: String) -> History {
        first(where: { $0.id == id }) ?? History()
    }
}
