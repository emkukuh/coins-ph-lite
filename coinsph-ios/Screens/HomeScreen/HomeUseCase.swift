//
//  HomeUseCase.swift
//  coinsph-ios
//
//  Created by kukuh on 21/05/22.
//

import Foundation

class HomeUseCase {
    var repository = Repository()
    var output = Output()
    var callback = Callback()

    func fetchData() {
        fetchWallets()
        fetchHistories()
    }

    func historyItemTapHandler(id: String) {
        let history = repository.histories.findById(id)
        output.cashedOutSenderName = history.sender
        output.cashedOutTargetName = history.recipient
        output.cashedOutAmount = history.amount
        output.entry = history.entry
        output.currency = history.currency
        callback.onHistoryItemTapHandler()
    }

    func fetchWallets() {
        callback.onWalletListStartLoading()
        WalletApiService().fetchWallets(completion: { [weak self] response in
            let wallets = response.wallets
            self?.callback.onSuccessFetchWallets(wallets)
        }, errorHandler: { [weak self] error in
            self?.callback.onError(error)
        })
    }

    func fetchHistories() {
        callback.onHistoryListStartLoading()
        if repository.isShowHistoryError {
            ErrorSampleApiService().fetchErrorSamples(
                completion: {},
                errorHandler: { error in
                    self.callback.onFailedFetchHistories(error)
                    self.callback.onHistoryListStopLoading()
                }
            )
            return
        }
        HistoryApiService().fetchHistories(completion: { [weak self] response in
            let histories = response.histories
            self?.repository.histories = histories
            self?.callback.onSuccessFetchHistories(histories)
        }, errorHandler: { [weak self] error in
            self?.callback.onError(error)
            self?.callback.onHistoryListStopLoading()
        })
    }
}

extension HomeUseCase {
    class Repository {
        var isShowHistoryError: Bool = false
        var histories = [History]()
    }
    class Output {
        var cashedOutSenderName: String = DefaultValues.string
        var cashedOutTargetName: String = DefaultValues.string
        var cashedOutAmount: String = DefaultValues.string
        var entry: HistoryEntry = .incoming
        var currency: String = DefaultValues.string
    }
    class Callback {
        var onError: Typealiases.StringHandler = { _ in return }
        var onSuccessFetchWallets: Typealiases.WalletsHandler = { _ in return }
        var onWalletListStartLoading: Typealiases.VoidHandler = { return }
        var onSuccessFetchHistories: Typealiases.HistoriesHandler = { _ in return }
        var onFailedFetchHistories: Typealiases.StringHandler = { _ in return }
        var onHistoryItemTapHandler: Typealiases.VoidHandler = { return }
        var onHistoryListStartLoading: Typealiases.VoidHandler = { return }
        var onHistoryListStopLoading: Typealiases.VoidHandler = { return }
    }
}
