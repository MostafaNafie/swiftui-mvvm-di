//
//  CharacterListViewModelTests.swift
//  ModularSwiftUITests
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import XCTest
import SwiftUI
@testable import CharacterList
@testable import CharacterDetails
@testable import SharedCharacterData

class CharacterListViewModelTests: XCTestCase {
    private var sut: CharacterListViewModel!
    private var coordinatorSpy: CharacterCoordinaterSpy!
    private var repository: CharacterRepository!

    override func setUp() {
        repository = CharacterRepository(networkService: MockCharacterListNetworkService())
        let interactor = CharacterListInteractor(repository: repository)
        coordinatorSpy = CharacterCoordinaterSpy()
        sut = CharacterListViewModel(
            interactor: interactor,
            coordinator: coordinatorSpy
        )
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
    func test_returns_correct_initial_state() {
        let expectedValue = 0
        let actualValue = sut.filteredCharacters.count
        
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func test_returns_correct_fetched_characters_count() {
        sut.viewDidLoad()
        
        let expectedValue = 3
        let actualValue = sut.filteredCharacters.count
        
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func test_returns_correct_fetched_characters_mapping() {
        sut.viewDidLoad()
        
        let expectedValue = "Walter White"
        let actualValue = sut.filteredCharacters.first?.name

        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func test_returns_correct_filtered_characters() {
        sut.viewDidLoad()
        sut.searchQuery = "wh"
        
        var expectedValue = "Walter White"
        var actualValue = sut.filteredCharacters.first?.name
        XCTAssertEqual(actualValue, expectedValue)

        sut.searchQuery = "jesse"
        sut.reloadCharacters()

        expectedValue = "Jesse Pinkman"
        actualValue = sut.filteredCharacters.first?.name
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func test_returns_correct_unfiltered_characters_after_reset() {
        sut.viewDidLoad()
        sut.searchQuery = "wh"
        sut.reloadCharacters()

        var expectedValue = 1
        var actualValue = sut.filteredCharacters.count
        XCTAssertEqual(actualValue, expectedValue)

        sut.searchQuery = ""
        sut.reloadCharacters()

        expectedValue = 3
        actualValue = sut.filteredCharacters.count
        XCTAssertEqual(actualValue, expectedValue)
    }

    func test_did_tap_character_navigates_sucessfully() {
        sut.didTapCharacter(with: 3)

        let expectedValue = 1
        let actualValue = coordinatorSpy.didTapCharacterCount
        XCTAssertEqual(actualValue, expectedValue)
    }

    func test_did_tap_character_correct_selected_character() {
        sut.viewDidLoad()
        sut.didTapCharacter(with: 3)

        let expectedValue = CharacterDetails.Character(
            name: "Henry Schrader",
            imageUrl: URL(string: "google.com")!,
            nickname: "Hank",
            birthday: "Unknown"
        )
        let actualValue = repository.getSelectedCharacter()
        XCTAssertEqual(actualValue, expectedValue)
    }
}
