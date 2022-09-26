//
//  CharacterListViewModelDoubles.swift
//  BreakingBadTests
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation
import Combine
@testable import BreakingBad

class MockCharacterListNetworkService: CharacterListNetworkServicing {
    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error> {
        let fakeCharacters: CharactersResponse = [
            .init(id: 1, name: "Walter White", birthday: nil, occupation: nil, img: "google.com", status: nil, nickname: nil, appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 2, name: "Walter White", birthday: nil, occupation: nil, img: "google.com", status: nil, nickname: nil, appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 3, name: "Walter White", birthday: nil, occupation: nil, img: "google.com", status: nil, nickname: nil, appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        ]
        return Just(fakeCharacters)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
