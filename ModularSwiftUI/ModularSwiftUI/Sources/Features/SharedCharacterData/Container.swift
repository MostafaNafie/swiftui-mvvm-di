//
//  File.swift
//  
//
//  Created by Nafie on 21/10/2024.
//

import Swinject
import Common
import CharacterList
import CharacterDetails

public extension Container {
    static func registerCharacterData() {
        shared.register(CharacterListNetworkServicing.self) { resolver in
            CharacterListNetworkService(
                client: resolver.resolve(HTTPClient.self)!
            )
        }
        shared.register(CharacterListRepositoryProtocol.self) { resolver in
            CharacterRepository(
                networkService: resolver.resolve(CharacterListNetworkServicing.self)!
            )
        }.inObjectScope(.weak)
        shared.register(CharacterDetailsRepositoryProtocol.self) { resolver in
            resolver.resolve(CharacterListRepositoryProtocol.self)! as! any CharacterDetailsRepositoryProtocol
        }
    }
}
