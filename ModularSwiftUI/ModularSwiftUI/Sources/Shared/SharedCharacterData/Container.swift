//
//  NetworkingRequest.swift
//  ModularSwiftUI
//
//  Created by Nafie on 21/10/2024.
//

@_exported import CharacterList
@_exported import CharacterDetails

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
