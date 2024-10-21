//
//  AppContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import Swinject
import CharacterList
import NetworkingInterface
import Networking

extension Container {
    static func registerMainDependencies() {
        shared.register(HTTPClient.self, factory: {_ in URLSessionClient()}).inObjectScope(.container)
        shared.register(CharacterCoordinating.self, factory: {_ in CharacterCoordinator()}).inObjectScope(.container)
    }
}
