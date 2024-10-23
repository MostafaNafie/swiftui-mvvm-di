//
//  View+onViewDidLoad.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

public struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() async -> Void)?

    public func body(content: Content) -> some View {
        content
            .task {
                if viewDidLoad == false {
                    viewDidLoad = true
                    await action?()
                }
            }
    }
}

public extension View {
    func onViewDidLoad(perform action: (() async -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
