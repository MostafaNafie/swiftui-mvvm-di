//
//  CharacterDetailsViewModel.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {
    @Published var character: Character

    init(character: Character) {
        self.character = character
    }
}
