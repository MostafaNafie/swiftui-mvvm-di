//
//  CharacterListNetworkService.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation

protocol CharacterListNetworkServicing {
    func fetchCharacters() async -> Result<CharactersResponse, Error>
}

struct CharacterListNetworkService: CharacterListNetworkServicing {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchCharacters() async -> Result<CharactersResponse, Error> {
        let request = CharactersRequest().buildURLRequest()
        return await client.perform(request)
    }
}
