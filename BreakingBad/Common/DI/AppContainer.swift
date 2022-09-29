//
//  AppContainer.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import Swinject

extension Container {
    static let AppContainer: Container = {
        let container = Container()
        container.register(HTTPClient.self, factory: {_ in URLSessionClient()}).inObjectScope(.container)
        container.register(CharacterCoordinating.self, factory: {_ in CharacterCoordinator()}).inObjectScope(.container)
        container.register(CharacterCoordinator.self) { $0.resolve(CharacterCoordinating.self)! as! CharacterCoordinator }
        return container
    }()
}
