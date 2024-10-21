//
//  CharactersListContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Swinject
import Common

public extension Container {
    static func registerCharactersList() {
        shared.register(CharacterListUseCase.self) { resolver in
            CharacterListUseCase(
                repository: resolver.resolve(CharacterListRepositoryProtocol.self)!
            )
        }
        shared.register(CharacterListViewModel.self) { resolver in
            CharacterListViewModel(
                characterListUseCase: resolver.resolve(CharacterListUseCase.self)!,
                coordinator: resolver.resolve(CharacterCoordinating.self)
            )
        }
    }
}
