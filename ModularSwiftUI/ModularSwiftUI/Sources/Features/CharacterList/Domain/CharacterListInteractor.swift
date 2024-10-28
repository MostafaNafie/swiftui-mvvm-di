//
//  CharactersListInteractor.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 01/10/2022.
//

@_exported import Common

public protocol CharacterListRepositoryProtocol: Actor {
    func getCharacters() async -> Result<[Character], Error>
    func setSelectedCharacter(with id: Int)
}

public struct CharacterListInteractor: Sendable {
    private let repository: CharacterListRepositoryProtocol

    public init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }

    func fetchCharacters() async -> Result<[Character], Error> {
        await repository.getCharacters()
    }

    func setSelectedCharacter(with id: Int) async {
        await repository.setSelectedCharacter(with: id)
    }
}
