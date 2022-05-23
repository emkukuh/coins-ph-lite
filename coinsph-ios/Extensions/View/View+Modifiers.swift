//
//  View+Modifiers.swift
//  coinsph-ios
//
//  Created by kukuh on 06/04/22.
//

import SwiftUI

extension View {
    @ViewBuilder func setHidden(_ isHidden: Bool, isRemove: Bool) -> some View {
        if isHidden {
            if !isRemove {
                self.hidden()
            }
        } else {
            self
        }
    }

    func onLoad(_ completionHandler: @escaping Typealiases.VoidHandler) -> some View {
        modifier(ViewDidLoadModifier(completionHandler))
    }

    @ViewBuilder func setLoading(_ isLoading: Bool) -> some View {
        if isLoading {
            ProgressView()
        } else {
            self
        }
    }
}
