//
//  CharactersListContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Swinject
import CharacterList
import NetworkingInterface

extension Container {
    static let CharactersListContainer: Container = {
        let container = Container(parent: AppContainer)
        container.register(CharacterListNetworkServicing.self, factory: { resolver in
            CharacterListNetworkService(client: resolver.resolve(HTTPClient.self)!)
        })
        container.register(CharacterListUseCase.self, factory: { resolver in
            CharacterListUseCase(networkService: resolver.resolve(CharacterListNetworkServicing.self)!)
        })
        container.register(CharacterListViewModel.self, factory: {resolver in
            CharacterListViewModel(characterListUseCase: resolver.resolve(CharacterListUseCase.self)!,
                                   coordinator: resolver.resolve(CharacterCoordinating.self))
            
        })
        return container
    }()
}
