//
//  DetailScreenViewModel.swift
//  coinsph-ios
//
//  Created by kukuh on 21/05/22.
//

import SwiftUI

class DetailScreenViewModel: ScreenViewModel {
    var title: String = DefaultValues.string
    var senderListItemViewModel = ListItemViewModel()
    var amountListItemViewModel = ListItemViewModel()
    var mainButtonViewModel = ButtonViewModel()

    override init() {
        super.init()
        amountListItemViewModel.title = R.string.title.amount()
        mainButtonViewModel.title = R.string.button.back()
        mainButtonViewModel.onTapHandler = { self.onBackHandler() }
    }
}
