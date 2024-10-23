//
//  CharacterListViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Observation

public protocol CharacterCoordinating: AnyObject {
    func didTapCharacter()
}

@Observable
public final class CharacterListViewModel {
    var filteredCharacters: [Character] = []
    var searchQuery: String = "" {
        didSet {
            filterCharacters(by: searchQuery)
        }
    }
    var error: Error? = nil

    private let interactor: CharacterListInteractor
    private let coordinator: CharacterCoordinating

    private var characters: [Character] = []

    init(
        interactor: CharacterListInteractor,
        coordinator: CharacterCoordinating
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
    }

    func viewDidLoad() async {
        await getCharacters()
    }

    func didTapCharacter(with id: Int) {
        interactor.setSelectedCharacter(with: id)
        coordinator.didTapCharacter()
    }
}

private extension CharacterListViewModel {
    func getCharacters() async {
        switch await interactor.fetchCharacters() {
            case .success(let characters):
                self.characters = characters
                self.filteredCharacters = characters
            case .failure(let error):
                self.error = error
        }
    }

    func filterCharacters(by searchQuery: String) {
        filteredCharacters = characters.filter {
            searchQuery.isEmpty ? true : $0.name
                .localizedCaseInsensitiveContains(searchQuery)
        }
    }
}
