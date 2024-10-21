//
//  CharactersListUseCase.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 01/10/2022.
//

import Combine
import Foundation

public protocol CharacterListRepositoryProtocol {
    func getCharacters() -> AnyPublisher<[Character], Error>
}

public struct CharacterListUseCase {
    private let repository: CharacterListRepositoryProtocol

    public init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters() -> AnyPublisher<[Character], Error> {
        repository.getCharacters()
            .print(#function)
            .eraseToAnyPublisher()
    }
}
