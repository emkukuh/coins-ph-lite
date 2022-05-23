//
//  NavigationBarViewModel.swift
//  CommonFiles
//
//  Created by kukuh on 08/04/22.
//

import SwiftUI

class NavigationBarViewModel: ObservableObject {
    @Published var isHidden: Bool = false
    @Published var backButtonViewModel = ButtonViewModel()
    @Published var rightButtonViewModel = ButtonViewModel()
    var title: String = DefaultValues.string
}
