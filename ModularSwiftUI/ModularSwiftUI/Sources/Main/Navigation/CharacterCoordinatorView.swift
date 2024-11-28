//
//  CharacterCoordinatorView.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI

public struct CharacterCoordinatorView: View {
    @StateObject var coordinator: CharacterCoordinator

    init(coordinator: CharacterCoordinator) {
        self._coordinator = StateObject(wrappedValue: coordinator)
        coordinator.start()
    }

    public var body: some View {
        NavigationView {
            coordinator.characterListScreen
                .navigation(item: $coordinator.characterDetailsScreen) { characterDetailsScreen in
                    characterDetailsScreen
                }
        }
    }
}
