//
//  CharacterListViewModelTests.swift
//  ModularSwiftUITests
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import XCTest

@testable import CharacterDetails
@testable import CharacterList
@testable import Main
@testable import SharedCharacterData

class CharacterListViewModelTests: XCTestCase {
    private var sut: CharacterListViewModel!

    override func setUp() {
        Container.shared.networkService.register { CharacterListNetworkServiceStub() }
        Container.shared.characterCoordinator.register { CharacterCoordinatorSpy() }
        sut = Container.shared.characterListViewModel()
    }

    override func tearDown() {
        sut = nil
    }

    func test_returns_correct_initial_state() {
        let expectedValue = 0
        let actualValue = sut.filteredCharacters.count

        XCTAssertEqual(actualValue, expectedValue)
    }

    @MainActor
    func test_returns_correct_fetched_characters_count() async {
        await sut.viewDidLoad()

        let expectedValue = 3
        let actualValue = sut.filteredCharacters.count

        XCTAssertEqual(actualValue, expectedValue)
    }

    @MainActor
    func test_returns_correct_fetched_characters_mapping() async {
        await sut.viewDidLoad()

        let expectedValue = "Walter White"
        let actualValue = sut.filteredCharacters.first?.name

        XCTAssertEqual(actualValue, expectedValue)
    }

    @MainActor
    func test_returns_correct_filtered_characters() async {
        await sut.viewDidLoad()
        sut.searchQuery = "wh"

        var expectedValue = "Walter White"
        var actualValue = sut.filteredCharacters.first?.name
        XCTAssertEqual(actualValue, expectedValue)

        sut.searchQuery = "jesse"

        expectedValue = "Jesse Pinkman"
        actualValue = sut.filteredCharacters.first?.name
        XCTAssertEqual(actualValue, expectedValue)
    }

    @MainActor
    func test_returns_correct_unfiltered_characters_after_reset() async {
        await sut.viewDidLoad()
        sut.searchQuery = "wh"

        var expectedValue = 1
        var actualValue = sut.filteredCharacters.count
        XCTAssertEqual(actualValue, expectedValue)

        sut.searchQuery = ""

        expectedValue = 3
        actualValue = sut.filteredCharacters.count
        XCTAssertEqual(actualValue, expectedValue)
    }

    @MainActor
    func test_did_tap_character_navigates_successfully() async {
        let coordinatorSpy = Container.shared.characterCoordinator() as! CharacterCoordinatorSpy
        await sut.didTapCharacter(with: 3)

        let expectedValue = 1
        let actualValue = coordinatorSpy.didTapCharacterCount
        XCTAssertEqual(actualValue, expectedValue)
    }

    @MainActor
    func test_did_tap_character_correct_selected_character() async {
        let repository = Container.shared.characterRepository()
        await sut.viewDidLoad()
        await sut.didTapCharacter(with: 3)

        let expectedValue = CharacterDetails.Character(
            name: "Henry Schrader",
            imageUrl: URL(string: "google.com")!,
            nickname: "Hank",
            birthday: "Unknown"
        )
        let actualValue = await repository.getSelectedCharacter()
        XCTAssertEqual(actualValue, expectedValue)
    }
}
