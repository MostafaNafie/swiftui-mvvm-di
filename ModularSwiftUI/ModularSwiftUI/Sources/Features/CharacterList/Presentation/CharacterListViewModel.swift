//
//  CharacterListViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Observation

public protocol CharacterCoordinating {
    @MainActor func didTapCharacter()
}

@Observable
public final class CharacterListViewModel {

    var filteredCharacters: [Character] = []
    var searchQuery: String = "" {
        didSet {
            filterCharacters(by: searchQuery)
        }
    }
    var isLoading: Bool = true
    var error: Error?

    private let interactor: CharacterListInteractor
    private let coordinator: CharacterCoordinating

    private var characters: [Character] = []

    public init(
        interactor: CharacterListInteractor,
        coordinator: CharacterCoordinating
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
    }

    @MainActor
    func viewDidLoad() async {
        await getCharacters()
    }

    @MainActor
    func didTapCharacter(with id: Int) async {
        await interactor.setSelectedCharacter(with: id)
        coordinator.didTapCharacter()
    }

    // Function that will fail SonarQube analysis
    func problematicFunction() {
        var unusedVariable = "This variable is never used"
        let anotherUnused = 42

        // Dead code
        if false {
            print("This will never execute")
        }

        // Magic numbers
        let timeout = 30
        let maxRetries = 3

        // Duplicate code
        for i in 0..<10 {
            print("Processing item \(i)")
        }

        for j in 0..<10 {
            print("Processing item \(j)")
        }

        // Complex nested conditions
        if timeout > 0 {
            if maxRetries > 0 {
                if unusedVariable.count > 0 {
                    if anotherUnused > 0 {
                        print("Too many nested conditions")
                    }
                }
            }
        }

        // Unused parameter (if this was a function with parameters)
        let _ = unusedVariable
        let _ = anotherUnused
    }
}

private extension CharacterListViewModel {
    @MainActor
    func getCharacters() async {
        switch await interactor.fetchCharacters() {
            case .success(let characters):
                self.characters = characters
                filteredCharacters = characters
                isLoading = false
            case .failure(let error):
                self.error = error
        }
    }

    func filterCharacters(by searchQuery: String) {
        filteredCharacters = characters.filter {
            searchQuery.isEmpty
                ? true
                : $0.name
                    .localizedCaseInsensitiveContains(searchQuery)
        }
    }
}
