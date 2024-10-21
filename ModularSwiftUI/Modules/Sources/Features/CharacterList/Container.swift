//
//  CharactersListContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Swinject
import NetworkingInterface
import Utilities

public extension Container {
    static func registerCharactersList() {
        shared.register(CharacterListNetworkServicing.self) { resolver in
            CharacterListNetworkService(
                client: resolver.resolve(HTTPClient.self)!
            )
        }
        shared.register(CharacterListUseCase.self) { resolver in
            CharacterListUseCase(
                networkService: resolver.resolve(CharacterListNetworkServicing.self)!
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
