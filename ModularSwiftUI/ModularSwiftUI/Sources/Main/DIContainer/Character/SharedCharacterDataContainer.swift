//
//  Untitled.swift
//  ModularSwiftUI
//
//  Created by Nafie on 28/10/2024.
//

import Foundation

extension Container {
    var networkService: Factory<CharacterListNetworkServicing> {
        self {
            CharacterListNetworkService(client: self.httpClient())
        }
    }

    var characterRepository: Factory<CharacterRepository> {
        self {
            CharacterRepository(networkService: self.networkService())
        }.shared
    }

    var characterDetailsRepository: Factory<CharacterDetailsRepositoryProtocol> {
        self {
            self.characterRepository()
        }
    }

    var characterListRepository: Factory<CharacterListRepositoryProtocol> {
        self {
            self.characterRepository()
        }
    }
}
