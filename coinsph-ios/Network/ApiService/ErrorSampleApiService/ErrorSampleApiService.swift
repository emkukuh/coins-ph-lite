//
//  ErrorSampleApiService.swift
//  coinsph-ios
//
//  Created by kukuh on 23/05/22.
//

import Foundation

class ErrorSampleApiService {
    struct Paths {
        static let error429 = "/error-429"
    }

    func fetchErrorSamples(
        completion: @escaping () -> Void,
        errorHandler: @escaping (String) -> Void
    ) {
        ApiService<ResponseEmpty>().request(
            path: Paths.error429,
            httpMethod: .get,
            completion: { _ in
                completion()
            },
            errorHandler: { responseError in
                errorHandler(responseError.message)
            }
        )
    }
}
