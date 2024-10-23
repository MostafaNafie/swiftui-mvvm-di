//
//  CharactersListInteractor.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 01/10/2022.
//

import Foundation

public protocol CharacterListRepositoryProtocol {
    func getCharacters() async -> Result<[Character], Error>
    func setSelectedCharacter(with id: Int)
}

struct CharacterListInteractor {
    private let repository: CharacterListRepositoryProtocol

    init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }

    func fetchCharacters() async -> Result<[Character], Error> {
        await repository.getCharacters()
    }

    func setSelectedCharacter(with id: Int) {
        repository.setSelectedCharacter(with: id)
    }
}
