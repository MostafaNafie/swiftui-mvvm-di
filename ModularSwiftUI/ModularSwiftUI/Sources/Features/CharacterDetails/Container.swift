//
//  CharacterDetailsContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Swinject
import Common

public extension Container {
    static func registerCharacterDetails() {
        shared.register(CharacterDetailsUseCase.self) { resolver in
            CharacterDetailsUseCase(
                repository: resolver.resolve(CharacterDetailsRepositoryProtocol.self)!
            )
        }
        shared.register(CharacterDetailsViewModel.self) { resolver in
            CharacterDetailsViewModel(
                characterDetailsUseCase: resolver.resolve(CharacterDetailsUseCase.self)!
            )
        }
    }
}
