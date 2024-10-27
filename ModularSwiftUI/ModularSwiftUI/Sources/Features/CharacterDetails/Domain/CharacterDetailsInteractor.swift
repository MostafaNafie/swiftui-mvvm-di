//
//  CharacterDetailsInteractor.swift
//  
//
//  Created by Nafie on 21/10/2024.
//

import Foundation

public protocol CharacterDetailsRepositoryProtocol: Actor {
    func getSelectedCharacter() -> Character
}

struct CharacterDetailsInteractor {
    private let repository: CharacterDetailsRepositoryProtocol

    init(repository: CharacterDetailsRepositoryProtocol) {
        self.repository = repository
    }

    func getSelectedCharacter() async -> Character {
        await repository.getSelectedCharacter()
    }
}
