//
//  File.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI
import Observation
import Swinject
import CharacterList
import CharacterDetails
import Models

@Observable
class CharacterCoordinator: Identifiable, CharacterCoordinating {
    var viewModel: CharacterListViewModel? = nil
    var detailViewModel: CharacterDetailsViewModel? = nil

    init() {
        registerDependencies()
    }

    func start() {
        viewModel = Container.shared.resolve(CharacterListViewModel.self)!
    }

    func open(_ character: Character) {
        detailViewModel = Container.shared.resolve(
            CharacterDetailsViewModel.self,
            argument: character
        )
    }
}

private extension CharacterCoordinator {
    func registerDependencies() {
        Container.registerCharactersList()
        Container.registerCharacterDetails()
    }
}
