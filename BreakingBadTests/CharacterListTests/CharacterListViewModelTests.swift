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
        let actualValue = sut.filteredCharacters.count
        
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_returns_correct_fetched_characters_count() {
        sut.viewDidLoad()
        
        let expectedValue = 3
        let actualValue = sut.filteredCharacters.count
        
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_returns_correct_fetched_characters_mapping() {
        sut.viewDidLoad()
        
        let expectedValue = "Walter White"
        let actualValue = sut.filteredCharacters.first?.name

        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_returns_correct_filtered_characters() {
        sut.viewDidLoad()
        sut.searchQuery = "wh"
        
        var expectedValue = "Walter White"
        var actualValue = sut.filteredCharacters.first?.name
        XCTAssertEqual(expectedValue, actualValue)
        
        sut.searchQuery = "jesse"
        
        expectedValue = "Jesse Pinkman"
        actualValue = sut.filteredCharacters.first?.name
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_returns_correct_unfiltered_characters_after_reset() {
        sut.viewDidLoad()
        sut.searchQuery = "wh"
        
        var expectedValue = 1
        var actualValue = sut.filteredCharacters.count
        XCTAssertEqual(expectedValue, actualValue)
        
        sut.searchQuery = ""
        
        expectedValue = 3
        actualValue = sut.filteredCharacters.count
        XCTAssertEqual(expectedValue, actualValue)
    }
}
