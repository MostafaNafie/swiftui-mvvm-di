//
//  CharacterDetailsViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Observation

@Observable
public final class CharacterDetailsViewModel {
    var character: Character

    public init(character: Character) {
        self.character = character
    }
}
