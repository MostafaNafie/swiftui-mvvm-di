//
//  CharacterListNetworkService.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation
import Common

protocol CharacterListNetworkServicing {
    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error>
}

struct CharacterListNetworkService: CharacterListNetworkServicing {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error> {
        let request = CharactersRequest().buildURLRequest()
        return client.perform(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
