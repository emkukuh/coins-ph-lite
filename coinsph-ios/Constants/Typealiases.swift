//
//  Typealiases.swift
//  CommonFiles
//
//  Created by kukuh on 08/04/22.
//

import Foundation
import UIKit

struct Typealiases {
    typealias VoidHandler = () -> Void
    typealias StringHandler = (String) -> Void
    typealias NetworkSuccessHandler = (Data, URLResponse?) -> Void
    typealias NetworkFailureHandler = (Data?, URLResponse?, NetworkError) -> Void
    typealias WalletsHandler = ([Wallet]) -> Void
    typealias HistoriesHandler = ([History]) -> Void
}
