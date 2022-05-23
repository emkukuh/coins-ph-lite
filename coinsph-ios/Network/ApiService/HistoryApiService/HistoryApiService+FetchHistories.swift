//
//  HistoryApiService+FetchHistories.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import Foundation

extension HistoryApiService {
    func fetchHistories(
        completion: @escaping (ResponseHistory) -> Void,
        errorHandler: @escaping (String) -> Void
    ) {
        ApiService<ResponseHistory>().request(
            path: Paths.fetchHistories,
            httpMethod: .get,
            completion: completion,
            errorHandler: { responseError in
                errorHandler(responseError.message)
            }
        )
    }
}
