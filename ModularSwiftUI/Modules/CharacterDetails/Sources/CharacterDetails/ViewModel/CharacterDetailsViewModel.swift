//
//  CharacterDetailsViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Foundation
import CharacterModels

public final class CharacterDetailsViewModel: ObservableObject {
    @Published var character: Character

    public init(character: Character) {
        self.character = character
    }
}
