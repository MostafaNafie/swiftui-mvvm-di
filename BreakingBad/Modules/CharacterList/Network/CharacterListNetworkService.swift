//
//  CharacterListNetworkService.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation

protocol CharacterListNetworkServicing {
    typealias CharactersResponse = [CharactersNetwork.Character]

    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error>
}

struct CharacterListNetworkService: CharacterListNetworkServicing {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error> {
        let urlString = "https://breakingbadapi.com/api/characters"
        let url = URL(string: urlString)
        
        return client.perform(URLRequest(url: url!))
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
