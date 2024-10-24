//
//  AppContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

@_exported import SharedCharacterData

extension Container: @retroactive AutoRegistering {
    // Fulfil the promises made in other modules. (Check promised function)
    public func autoRegister() {
        registerMain()
        registerCharacterData()
    }
}

private extension Container {
    func registerMain() {
        httpClient.register {
            URLSessionClient()
        }

        characterCoordinator.register {
            CharacterCoordinator()
        }
    }
}
