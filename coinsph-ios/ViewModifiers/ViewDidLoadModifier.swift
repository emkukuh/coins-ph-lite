//
//  ViewDidLoadModifier.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var didLoad = false
    private let completionHandler: Typealiases.VoidHandler

    init(_ completionHandler: @escaping Typealiases.VoidHandler) {
        self.completionHandler = completionHandler
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad { return }
            didLoad = true
            completionHandler()
        }
    }
}
