//
//  CharacterDetailsContainer.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Swinject
import Utilities

public extension Container {
    static func registerCharacterDetails() {
        shared.register(CharacterDetailsViewModel.self) { _, character in
            CharacterDetailsViewModel(character: character)
        }
    }
}
