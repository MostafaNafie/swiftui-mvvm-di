//
//  CharacterRepository.swift
//
//
//  Created by Nafie on 21/10/2024.
//

import Foundation
import Combine
import CharacterList
import CharacterDetails

final public class CharacterRepository {
    private let networkService: CharacterListNetworkServicing
    private var characters: CharactersResponse = []

    public init(networkService: CharacterListNetworkServicing) {
        self.networkService = networkService
    }
}

extension CharacterRepository: CharacterListRepositoryProtocol {
    public func getCharacters() -> AnyPublisher<[CharacterList.Character], Error> {
        networkService.fetchCharacters()
            .print(#function)
            .map{ [weak self] charactersResponse in
                self?.characters = charactersResponse
                return charactersResponse.map {
                    CharacterList.Character(
                        id: $0.id,
                        name: $0.name,
                        imageUrl: URL(string: $0.img)!
                    )
                }
            }
            .eraseToAnyPublisher()
    }
}

extension CharacterRepository: CharacterDetailsRepositoryProtocol {
    public func getCharacter(with id: Int) -> CharacterDetails.Character {
        guard let character = characters.first(where: { $0.id == id }) else {
            fatalError("No character with id: \(id)")
        }
        return CharacterDetails.Character(
            name: character.name,
            imageUrl: URL(string: character.img)!,
            nickname: character.nickname,
            birthday: character.birthday
        )
    }
}
