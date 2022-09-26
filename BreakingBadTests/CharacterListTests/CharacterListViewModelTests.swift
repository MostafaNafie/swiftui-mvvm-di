//
//  CharacterListViewModelTests.swift
//  BreakingBadTests
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import XCTest
import SwiftUI
@testable import BreakingBad

class CharacterListViewModelTests: XCTestCase {
    let mockNetworkService: CharacterListNetworkServicing = MockCharacterListNetworkService()
    var sut: CharacterListViewModel!
    
    override func setUp() {
        self.sut = CharacterListViewModel(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
    func test_returns_correct_initial_state() {
        let expectedValue = 0
        let actualValue = sut.characters.count
        
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_returns_correct_fetched_characters_count() {
        sut.fetchCharacters()
        
        let expectedValue = 3
        let actualValue = sut.characters.count
        
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_returns_correct_fetched_characters_mapping() {
        sut.fetchCharacters()
        
        let expectedValue = "Walter White"
        let actualValue = sut.characters.first?.name

        XCTAssertEqual(expectedValue, actualValue)
    }
}
