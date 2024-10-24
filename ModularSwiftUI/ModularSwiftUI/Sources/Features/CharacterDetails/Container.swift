//
//  CharacterDetailsContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Common
import Factory

public extension Container {
    var characterDetailsRepository: Factory<CharacterDetailsRepositoryProtocol?> { promised() }

    var characterDetailsViewModel: Factory<CharacterDetailsViewModel> {
        self {
            CharacterDetailsViewModel(interactor: self.characterDetailsInteractor())
        }
    }
}


private extension Container {
    var characterDetailsInteractor: Factory<CharacterDetailsInteractor> {
        self {
            CharacterDetailsInteractor(repository: self.characterDetailsRepository()!)
        }
    }
}
