//
//  ScreenContent.swift
//  CommonFiles
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

protocol ScreenContent: View {
    associatedtype VM: ScreenViewModel
    var viewModel: VM { get }
}
