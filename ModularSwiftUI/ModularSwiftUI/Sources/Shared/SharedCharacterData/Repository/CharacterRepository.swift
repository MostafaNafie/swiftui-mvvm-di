//
//  CharacterRepository.swift
//
//
//  Created by Nafie on 21/10/2024.
//

import Foundation
import CharacterList
import CharacterDetails

final class CharacterRepository {
    private let networkService: CharacterListNetworkServicing
    private var characters: CharactersResponse = []
    private var selectedCharacterID = 0

    init(networkService: CharacterListNetworkServicing) {
        self.networkService = networkService
    }
}

extension CharacterRepository: CharacterListRepositoryProtocol {
    func getCharacters() async -> Result<[CharacterList.Character], Error> {
        await networkService.fetchCharacters()
            .map {
                [weak self] charactersResponse in
                self?.characters = charactersResponse
                return charactersResponse.map {
                    CharacterList.Character(
                        id: $0.id,
                        name: $0.name,
                        imageUrl: URL(string: $0.img)!
                    )
                }
            }
    }

    public func setSelectedCharacter(with id: Int) {
        selectedCharacterID = id
    }
}

extension CharacterRepository: CharacterDetailsRepositoryProtocol {
    func getSelectedCharacter() -> CharacterDetails.Character {
        guard let character = characters.first(where: { $0.id == selectedCharacterID }) else {
            fatalError("No character with id: \(selectedCharacterID)")
        }
        return CharacterDetails.Character(
            name: character.name,
            imageUrl: URL(string: character.img)!,
            nickname: character.nickname,
            birthday: character.birthday
        )
    }
}
