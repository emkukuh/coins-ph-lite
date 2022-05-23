//
//  ResponseError.swift
//  coinsph-ios
//
//  Created by kukuh on 23/05/22.
//

import ObjectMapper

struct ResponseError: Mappable {
    var code: String = "-99"
    var message: String = "Default Error"
    
    init() {}
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        code <- map["errors.non_field_errors.code"]
        message <- map["errors.non_field_errors.message"]
    }
}
