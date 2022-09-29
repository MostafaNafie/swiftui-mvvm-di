//
//  CharactersListContainer.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Swinject

extension Container {
    static let CharactersListContainer: Container = {
        let container = Container(parent: AppContainer)
        container.register(CharacterListNetworkServicing.self, factory: { resolver in
            CharacterListNetworkService(client: resolver.resolve(HTTPClient.self)!)
        })
        container.register(CharacterListViewModel.self, factory: {resolver in
            CharacterListViewModel(networkService: resolver.resolve(CharacterListNetworkServicing.self)!,
                                   coordinator: resolver.resolve(CharacterCoordinating.self))
            
        })
        return container
    }()
}
