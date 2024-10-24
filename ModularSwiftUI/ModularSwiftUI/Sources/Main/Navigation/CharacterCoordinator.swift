//
//  NetworkingRequest.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI
import Observation

@Observable
class CharacterCoordinator: Identifiable {
    var characterListViewModel: CharacterListViewModel!
    var characterDetailsViewModel: CharacterDetailsViewModel!

    func start() {
        characterListViewModel = Container.shared.characterListViewModel()
    }
}

extension CharacterCoordinator: CharacterCoordinating {
    func didTapCharacter() {
        characterDetailsViewModel = Container.shared.characterDetailsViewModel()
    }
}
