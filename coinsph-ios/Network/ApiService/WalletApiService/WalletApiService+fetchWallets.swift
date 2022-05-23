//
//  WalletApiService+fetchWallets.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import Alamofire
import ObjectMapper

extension WalletApiService {
    func fetchWallets(
        completion: @escaping (ResponseWallet) -> Void,
        errorHandler: @escaping (String) -> Void
    ) {
        ApiService<ResponseWallet>().request(
            path: Paths.getWallet,
            httpMethod: .get,
            completion: completion,
            errorHandler: { responseError in
                errorHandler(responseError.message)
            }
        )
    }
}
