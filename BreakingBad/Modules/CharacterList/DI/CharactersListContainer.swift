//
//  CharactersListContainer.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Swinject
import Foundation

extension Container {
    static let CharactersListContainer: Container = {
        let container = Container()
        container.register(HTTPClient.self, factory: {_ in URLSessionClient()})
        container.register(CharacterListNetworkServicing.self, factory: {resolver in
            CharacterListNetworkService(client: resolver.resolve(HTTPClient.self)!)
        })
        container.register(CharacterListViewModel.self, factory: {resolver in
            CharacterListViewModel(networkService: resolver.resolve(CharacterListNetworkServicing.self)!)
        })
        return container
    }()
}
