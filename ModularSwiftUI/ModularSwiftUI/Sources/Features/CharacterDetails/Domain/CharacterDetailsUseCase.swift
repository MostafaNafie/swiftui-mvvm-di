//
//  File.swift
//  
//
//  Created by Nafie on 21/10/2024.
//

import Foundation

public protocol CharacterDetailsRepositoryProtocol {
    func getCharacter(with id: Int) -> Character
}

public struct CharacterDetailsUseCase {
    private let repository: CharacterDetailsRepositoryProtocol

    public init(repository: CharacterDetailsRepositoryProtocol) {
        self.repository = repository
    }

    func getCharacter(with id: Int) -> Character {
        repository.getCharacter(with: id)
    }
}
