//
//  CharactersListUseCase.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 01/10/2022.
//

import Combine
import Foundation
import Models

public struct CharacterListUseCase {
    private let networkService: CharacterListNetworkServicing
    
    public init(networkService: CharacterListNetworkServicing) {
        self.networkService = networkService
    }
    
    func fetchCharacters() -> AnyPublisher<[Character], Error> {
        networkService.fetchCharacters()
            .print(#function)
            .map{ charactersResponse in
                charactersResponse.map {
                    Character(id: $0.id,
                              name: $0.name,
                              imageUrl: URL(string: $0.img)!,
                              nickname: $0.nickname,
                              birthday: $0.birthday)
                }
            }
            .eraseToAnyPublisher()
    }
}
