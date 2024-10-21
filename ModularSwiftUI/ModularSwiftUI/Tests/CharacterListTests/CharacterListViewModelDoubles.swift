//
//  CharacterListViewModelDoubles.swift
//  ModularSwiftUITests
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation
import Combine
@testable import CharacterList

class MockCharacterListNetworkService: CharacterListNetworkServicing {
    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error> {
        let fakeCharacters: CharactersResponse = [
            .init(id: 1, name: "Walter White", birthday: "", occupation: nil, img: "google.com", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 2, name: "Jesse Pinkman", birthday: "", occupation: nil, img: "google.com", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 3, name: "Henry Schrader", birthday: "", occupation: nil, img: "google.com", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        ]
        return Just(fakeCharacters)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
