//
//  CharacterDetailsInteractor.swift
//  
//
//  Created by Nafie on 21/10/2024.
//

import Foundation

public protocol CharacterDetailsRepositoryProtocol {
    func getSelectedCharacter() -> Character
}

public struct CharacterDetailsInteractor {
    private let repository: CharacterDetailsRepositoryProtocol

    public init(repository: CharacterDetailsRepositoryProtocol) {
        self.repository = repository
    }

    func getSelectedCharacter() -> Character {
        repository.getSelectedCharacter()
    }
}
