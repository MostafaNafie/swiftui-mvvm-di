//
//  CharacterListNetworkService.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation

public protocol CharacterListNetworkServicing: Sendable {
    func fetchCharacters() async -> Result<CharactersResponse, Error>
}

public struct CharacterListNetworkService: CharacterListNetworkServicing {
    private let client: HTTPClient

    public init(client: HTTPClient) {
        self.client = client
    }

    public func fetchCharacters() async -> Result<CharactersResponse, Error> {
        let request = CharactersRequest().buildURLRequest()
        return await client.perform(request)
    }
}
