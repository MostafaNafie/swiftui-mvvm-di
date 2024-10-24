//
//  CharactersListContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

@_exported import Common

public extension Container {
    var characterCoordinator: Factory<CharacterCoordinating?> { promised().shared }
    var characterListRepository: Factory<CharacterListRepositoryProtocol?> { promised() }

    var characterListViewModel: Factory<CharacterListViewModel> {
        self {
            CharacterListViewModel(
                interactor: self.characterListInteractor(),
                coordinator: self.characterCoordinator()!
            )
        }
    }
}

private extension Container {
    var characterListInteractor: Factory<CharacterListInteractor> {
        self {
            CharacterListInteractor(repository: self.characterListRepository()!)
        }
    }
}
