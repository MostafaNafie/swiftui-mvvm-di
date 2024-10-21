//
//  ModularSwiftUIApp.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Main

@main
struct ModularSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            Entry.shared.rootView
        }
    }
}
