//
//  CharacterListViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Observation

public protocol CharacterCoordinating: AnyObject {
    func didTapCharacter(with id: Int)
}

@Observable
public final class CharacterListViewModel: ObservableObject {
    var filteredCharacters: [Character] = []
    var searchQuery: String = ""
    var error: Error? = nil

    private let interactor: CharacterListInteractor
    private let coordinator: CharacterCoordinating
    
    private var characters: [Character] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init(
        interactor: CharacterListInteractor,
        coordinator: CharacterCoordinating
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        getCharacters()
    }
    
    func didTapCharacter(with id: Int) {
        interactor.setSelectedCharacter(with: id)
        coordinator.didTapCharacter(with: id)
    }

    func reloadCharacters() {
        filteredCharacters = characters.filter {
          searchQuery.isEmpty ? true : $0.name
            .localizedCaseInsensitiveContains(searchQuery)
        }
    }
}

private extension CharacterListViewModel {
    func getCharacters() {
        interactor
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
