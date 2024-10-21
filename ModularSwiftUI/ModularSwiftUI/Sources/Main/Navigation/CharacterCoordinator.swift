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
import SharedCharacterData

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

    func didTapCharacter(with id: Int) {
        detailViewModel = Container.shared.resolve(CharacterDetailsViewModel.self)
    }
}

private extension CharacterCoordinator {
    func registerDependencies() {
        Container.registerCharactersList()
        Container.registerCharacterDetails()
        Container.registerCharacterData()
    }
}
