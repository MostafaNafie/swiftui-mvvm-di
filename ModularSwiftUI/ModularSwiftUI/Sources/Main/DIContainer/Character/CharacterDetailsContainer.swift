//
//  CharacterDetailsContainer.swift
//  ModularSwiftUI
//
//  Created by Nafie on 28/10/2024.
//

import Foundation

extension Container {
    var characterDetailsInteractor: Factory<CharacterDetailsInteractor> {
        self {
            CharacterDetailsInteractor(repository: self.characterDetailsRepository())
        }
    }

    var characterDetailsViewModel: Factory<CharacterDetailsViewModel> {
        self {
            CharacterDetailsViewModel(interactor: self.characterDetailsInteractor())
        }
    }
}
