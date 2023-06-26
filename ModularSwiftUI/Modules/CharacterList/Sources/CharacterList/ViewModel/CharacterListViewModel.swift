//
//  CharacterListViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Observation
import CharacterModels

public protocol CharacterCoordinating: AnyObject {
    func open(_ character: Character)
}

// Migrating to Observable
// https://useyourloaf.com/blog/migrating-to-observable/
@Observable
public final class CharacterListViewModel: ObservableObject {
    var filteredCharacters: [Character] = []
    var searchQuery: String = ""
    var error: Error? = nil

    private var characters: [Character] = []
    private let characterListUseCase: CharacterListUseCase
    private let coordinator: CharacterCoordinating?
    private var cancellables: Set<AnyCancellable> = []
    
    public init(characterListUseCase: CharacterListUseCase,
         coordinator: CharacterCoordinating? = nil) {
        self.characterListUseCase = characterListUseCase
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        fetchCharacters()
    }
    
    func open(_ character: Character) {
        coordinator?.open(character)
    }

    func reloadCharacters() {
        filteredCharacters = characters.filter {
          searchQuery.isEmpty ? true : $0.name
            .localizedCaseInsensitiveContains(searchQuery)
        }
    }
}

private extension CharacterListViewModel {
    func fetchCharacters() {
        characterListUseCase
            .fetchCharacters()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                    case .failure(let error):
                        self?.error = error
                    case .finished:
                        print("Success: \(#function)")
                }
            }, receiveValue: { [weak self] value in
                guard let self else { return }
                characters = value
                reloadCharacters()
            })
            .store(in: &cancellables)
    }
}
