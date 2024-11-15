//
//  NetworkingRequest.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import Observation
import SwiftUI

@Observable
class CharacterCoordinator: Identifiable {
    var characterListScreen: CharacterListScreen!
    var characterDetailsScreen: CharacterDetailsScreen!

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
