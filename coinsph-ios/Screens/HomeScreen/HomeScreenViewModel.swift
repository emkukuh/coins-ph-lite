//
//  HomeScreenViewModel.swift
//  coinsph-ios
//
//  Created by kukuh on 20/05/22.
//

import SwiftUI
import Combine

class HomeScreenViewModel: ScreenViewModel {
    @Published var appStateDebug = AppStateDebug.shared
    private var useCase = HomeUseCase()
    @Published var debuggerButtonModel = ButtonViewModel()
    @Published var listItemViewModels = [ListItemViewModel]()
    @Published var myWalletListViewModel = ListViewModel()
    @Published var historyListViewModel = ListViewModel()
    private var anyCancellable = Set<AnyCancellable>()

    func fetchData() {
        myWalletListViewModel.isLoading = true
        historyListViewModel.isLoading = true
        historyListViewModel.isError = false
        historyListViewModel.isError = false
        useCase.fetchData()
    }

    private func setupWalletList(_ wallets: [Wallet]) {
        let listItemModels: [ListItemViewModel] = wallets.map { wallet in
            let model = ListItemViewModel()
            model.title = wallet.walletName
            model.value = wallet.balance
            return model
        }
        myWalletListViewModel.isError = appStateDebug.isErrorDebug
        myWalletListViewModel.reloadButtonModel.onTapHandler = useCase.fetchWallets
        myWalletListViewModel.listItemModels = listItemModels
        myWalletListViewModel.isLoading = false
    }

    private func setupHistoryList(_ histories: [History]) {
        let listItemModels: [ListItemViewModel] = histories.map { history in
            let model = ListItemViewModel()
            model.key = history.id
            model.title = history.entry == .outgoing
            ? R.string.title.youHaveCashedOutTo(history.recipient)
            : R.string.title.youHaveReceivedPayment()
            model.value = history.amount.withCurrency(history.currency)
            model.onTap = self.useCase.historyItemTapHandler
            return model
        }
        historyListViewModel.isError = appStateDebug.isErrorDebug
        historyListViewModel.reloadButtonModel.onTapHandler = useCase.fetchHistories
        historyListViewModel.listItemModels = listItemModels
        historyListViewModel.isLoading = false
    }

    private func setupErrorDebug() {
        appStateDebug.$isErrorDebug.sink { isErrorDebug in
            self.debuggerButtonModel.title = isErrorDebug
                ? "Show History Success Example"
                : "Show History Error Example"
        }.store(in: &anyCancellable)
        debuggerButtonModel.onTapHandler = {
            self.appStateDebug.isErrorDebug = !self.appStateDebug.isErrorDebug
            self.useCase.repository.isShowHistoryError = self.appStateDebug.isErrorDebug
            self.useCase.fetchHistories()
        }
    }

    func setUseCase(_ usecase: HomeUseCase) {
        usecase.callback.onSuccessFetchWallets = setupWalletList
        usecase.callback.onSuccessFetchHistories = setupHistoryList
        usecase.callback.onFailedFetchHistories = { error in
            self.historyListViewModel.isError = true
            self.showToast(message: error)
        }
        usecase.callback.onHistoryListStartLoading = {
            self.historyListViewModel.isError = false
            self.historyListViewModel.startLoading()
        }
        usecase.callback.onWalletListStartLoading = {
            self.myWalletListViewModel.isError = false
            self.myWalletListViewModel.startLoading()
        }
        usecase.callback.onHistoryListStopLoading = historyListViewModel.stopLoading
        setupErrorDebug()
        self.useCase = usecase
    }
}
