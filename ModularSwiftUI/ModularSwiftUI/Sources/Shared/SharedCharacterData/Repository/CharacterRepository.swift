//
//  CharacterRepository.swift
//
//
//  Created by Nafie on 21/10/2024.
//

@_exported import CharacterList
@_exported import CharacterDetails

public final actor CharacterRepository {
    private let networkService: CharacterListNetworkServicing
    private var characters: CharactersResponse = []
    private var selectedCharacterID = 0

    public init(networkService: CharacterListNetworkServicing) {
        self.networkService = networkService
    }
}

extension CharacterRepository: CharacterListRepositoryProtocol {
    public func getCharacters() async -> Result<[CharacterList.Character], Error> {
        let response = await networkService.fetchCharacters()
        switch response {
            case .success(let charactersResponse):
                characters = charactersResponse
                return .success(
                    charactersResponse.map { $0.toListCharacter() }
                )
            case .failure(let error):
                return .failure(error)
        }
    }

    public func setSelectedCharacter(with id: Int) {
        selectedCharacterID = id
    }
}

extension CharacterRepository: CharacterDetailsRepositoryProtocol {
    public func getSelectedCharacter() -> CharacterDetails.Character {
        guard let character = characters.first(where: { $0.id == selectedCharacterID }) else {
            print("No character with id: \(selectedCharacterID)")
            return CharacterDetails.Character.empty
        }
        return character.toDetailsCharacter()
    }
}
