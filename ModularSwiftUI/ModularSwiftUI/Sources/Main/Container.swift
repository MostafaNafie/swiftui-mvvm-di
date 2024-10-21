//
//  AppContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import Swinject
import CharacterList
import Common

extension Container {
    static func registerMainDependencies() {
        shared.register(HTTPClient.self) {_ in
            URLSessionClient()
        }.inObjectScope(.container)
        shared.register(CharacterCoordinating.self) {_ in
            CharacterCoordinator()
        }.inObjectScope(.container)
    }
}
