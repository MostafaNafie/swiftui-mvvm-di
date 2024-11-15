//
//  CharacterDetailsInteractor.swift
//
//
//  Created by Nafie on 21/10/2024.
//

@_exported import Common

public protocol CharacterDetailsRepositoryProtocol: Actor {
    func getSelectedCharacter() -> Character
}

public struct CharacterDetailsInteractor: Sendable {
    private let repository: CharacterDetailsRepositoryProtocol

    public init(repository: CharacterDetailsRepositoryProtocol) {
        self.repository = repository
    }

    func getSelectedCharacter() async -> Character {
        await repository.getSelectedCharacter()
    }
}
