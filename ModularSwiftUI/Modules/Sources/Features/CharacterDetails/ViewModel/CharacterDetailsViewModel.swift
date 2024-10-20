//
//  CharacterDetailsViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Observation
import Models

@Observable
public final class CharacterDetailsViewModel {
    var character: Character = .init(id: 0, name: "", imageUrl: .init(string: "google.com")!, nickname: "", birthday: "")

    public init(character: Character) {
        self.character = character
    }
}
