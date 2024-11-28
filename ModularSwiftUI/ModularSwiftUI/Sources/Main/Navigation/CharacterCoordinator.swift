//
//  NetworkingRequest.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI

class CharacterCoordinator: ObservableObject, Identifiable {
    @Published var characterListScreen: CharacterListScreen!
    @Published var characterDetailsScreen: CharacterDetailsScreen!

    @MainActor
    func start() {
        characterListScreen = CharacterListScreen(
            viewModel: Container.shared.characterListViewModel()
        )
    }
}

extension CharacterCoordinator: CharacterCoordinating {
    @MainActor
    public func didTapCharacter() {
        characterDetailsScreen = CharacterDetailsScreen(
            viewModel: Container.shared.characterDetailsViewModel()
        )
    }
}
