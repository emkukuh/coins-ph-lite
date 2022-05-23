//
//  ResponseHistory.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import ObjectMapper

struct ResponseHistory: Mappable {
    var histories: [History] = []
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        histories <- map["histories"]
    }
}
