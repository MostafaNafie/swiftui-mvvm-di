//
//  CharacterDetailsContainer.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Swinject

extension Container {
    static let CharacterDetailsContainer: Container = {
        let container = Container()
        container.register(CharacterDetailsViewModel.self) { _, character in
            CharacterDetailsViewModel(character: character)
        }
        return container
    }()
}
