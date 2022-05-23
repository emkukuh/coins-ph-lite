//
//  HomeCoordinator.swift
//  coinsph-ios
//
//  Created by kukuh on 20/05/22.
//

import SwiftUI

struct HomeCoordinator: View {
    @State var activeCoordinatorName: String?
    @State var viewModel = HomeScreenViewModel()
    @State var useCase = HomeUseCase()
    var body: some View {
        NavigationView {
            ZStack {
                Screen { HomeScreen(viewModel: setupViewModel()) }
                renderNavigationLink()
            }
        }
    }

    private func setupViewModel() -> HomeScreenViewModel {
        setupNavigationBarModel()
        viewModel.historyListViewModel.title = R.string.title.history()
        viewModel.myWalletListViewModel.title = R.string.title.myWallets()
        viewModel.setUseCase(setupUseCase())
        return viewModel
    }

    private func setupNavigationBarModel() {
        viewModel.navigationViewModel.backButtonViewModel.isHidden = true
        viewModel.navigationViewModel.title = R.string.title.coinsLite()
    }

    private func setupUseCase() -> HomeUseCase {
        useCase.callback.onHistoryItemTapHandler = showDetailScreenCoordinator
        return useCase
    }

    private func showDetailScreenCoordinator() {
        activeCoordinatorName = DetailScreenCoordinator.name
    }

    private func renderNavigationLink() -> some View {
        Group {
          DetailScreenCoordinator(
            activeCoordinatorName: $activeCoordinatorName,
            entry: $useCase.output.entry,
            currency: $useCase.output.currency,
            cashedOutSenderName: $useCase.output.cashedOutSenderName,
            cashedOutTargetName: $useCase.output.cashedOutTargetName,
            cashedOutAmount: $useCase.output.cashedOutAmount
          )
        }
    }
}
