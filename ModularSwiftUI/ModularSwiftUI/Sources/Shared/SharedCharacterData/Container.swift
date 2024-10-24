//
//  NetworkingRequest.swift
//  ModularSwiftUI
//
//  Created by Nafie on 21/10/2024.
//

import Swinject
import Common
import CharacterList
import CharacterDetails

public extension Container {
    func registerCharacterData() {
        characterDetailsRepository.register {
            self.characterRepository()
        }
        characterListRepository.register {
            self.characterRepository()
        }
    }
}

private extension Container {
    var networkService: Factory<CharacterListNetworkServicing> {
        self {
            CharacterListNetworkService(client: self.httpClient()!)
        }
    }

    var characterRepository: Factory<CharacterRepository> {
        self {
            CharacterRepository(networkService: self.networkService())
        }.shared
    }
}
