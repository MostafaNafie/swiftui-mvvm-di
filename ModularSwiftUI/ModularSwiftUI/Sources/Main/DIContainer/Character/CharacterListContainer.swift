//
//  CharacterListContainer.swift
//  ModularSwiftUI
//
//  Created by Nafie on 28/10/2024.
//

import Foundation

extension Container {
    var characterListInteractor: Factory<CharacterListInteractor> {
        self {
            CharacterListInteractor(repository: self.characterListRepository())
        }
    }

    var characterListViewModel: Factory<CharacterListViewModel> {
        self {
            CharacterListViewModel(
                interactor: self.characterListInteractor(),
                coordinator: self.characterCoordinator()
            )
        }
    }
}
