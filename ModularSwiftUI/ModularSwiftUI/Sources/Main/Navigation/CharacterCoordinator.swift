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

    func open(_ character: CharacterList.Character) {
        detailViewModel = Container.shared.resolve(
            CharacterDetailsViewModel.self,
            argument: mapCharacterFromListToDetails(character)
        )
    }
}

private extension CharacterCoordinator {
    func registerDependencies() {
        Container.registerCharactersList()
        Container.registerCharacterDetails()
    }

    func mapCharacterFromListToDetails(_ character: CharacterList.Character) -> CharacterDetails.Character {
        CharacterDetails.Character(
            name: character.name,
            imageUrl: character.imageUrl,
            nickname: character.nickname,
            birthday: character.birthday
        )
    }
}
