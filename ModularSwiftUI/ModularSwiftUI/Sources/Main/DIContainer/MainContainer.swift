//
//  AppContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

@_exported import Factory
@_exported import SharedCharacterData

extension Container {
    var httpClient: Factory<HTTPClient> {
        self {
            URLSessionClient()
        }.singleton
    }

    var characterCoordinator: Factory<CharacterCoordinating> {
        self {
            CharacterCoordinator()
        }.shared
    }
}
