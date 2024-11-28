//
//  CharacterListViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation

public protocol CharacterCoordinating {
    @MainActor func didTapCharacter()
}

public final class CharacterListViewModel: ObservableObject {
    @Published var filteredCharacters: [Character] = []
    @Published var isLoading: Bool = true
    @Published var error: Error?

    var searchQuery: String = "" {
        didSet {
            filterCharacters(by: searchQuery)
        }
    }

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
