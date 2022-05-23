//
//  ResponseEmpty.swift
//  coinsph-ios
//
//  Created by kukuh on 23/05/22.
//

import ObjectMapper

struct ResponseEmpty: Mappable {
    init?(map: Map) {}

    mutating func mapping(map: Map) {}
}

