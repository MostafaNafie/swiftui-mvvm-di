//
//  CharactersListInteractor.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 01/10/2022.
//

import Combine
import Foundation

public protocol CharacterListRepositoryProtocol {
    func getCharacters() -> AnyPublisher<[Character], Error>
    func setSelectedCharacter(with id: Int)
}

public struct CharacterListInteractor {
    private let repository: CharacterListRepositoryProtocol

    public init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters() -> AnyPublisher<[Character], Error> {
        repository.getCharacters()
            .print(#function)
            .eraseToAnyPublisher()
    }

    func setSelectedCharacter(with id: Int) {
        repository.setSelectedCharacter(with: id)
    }
}
