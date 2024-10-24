//
//  CharacterListViewModelDoubles.swift
//  ModularSwiftUITests
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation
@testable import SharedCharacterData

class MockCharacterListNetworkService: CharacterListNetworkServicing {
    func fetchCharacters() async -> Result<CharactersResponse, any Error> {
        .success([
            .init(id: 1, name: "Walter White", birthday: "", occupation: nil, img: "google.com", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 2, name: "Jesse Pinkman", birthday: "", occupation: nil, img: "google.com", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 3, name: "Henry Schrader", birthday: "Unknown", occupation: nil, img: "google.com", status: nil, nickname: "Hank", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        ])
    }
}

class CharacterCoordinatorSpy: CharacterCoordinating {
    var didTapCharacterCount = 0

    func didTapCharacter() {
        didTapCharacterCount += 1
    }
}
