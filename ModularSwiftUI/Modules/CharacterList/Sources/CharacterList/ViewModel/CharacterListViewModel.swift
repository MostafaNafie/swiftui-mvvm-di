//
//  CharacterListViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation
import CharacterModels

public protocol CharacterCoordinating: AnyObject {
    func open(_ character: Character)
}

public final class CharacterListViewModel: ObservableObject {
    @Published var filteredCharacters: [Character] = []
    @Published var searchQuery: String = ""
    @Published var error: Error?
    
    @Published private var characters: [Character] = []
    private let characterListUseCase: CharacterListUseCase
    private let coordinator: CharacterCoordinating?
    private var cancellables: Set<AnyCancellable> = []
    
    public init(characterListUseCase: CharacterListUseCase,
         coordinator: CharacterCoordinating? = nil) {
        self.characterListUseCase = characterListUseCase
        self.coordinator = coordinator
        
        setupBindings()
    }
    
    func viewDidLoad() {
        fetchCharacters()
    }
    
    func open(_ character: Character) {
        coordinator?.open(character)
    }
}

private extension CharacterListViewModel {
    func setupBindings() {
        $searchQuery
            .print("SearchQuery")
            .combineLatest($characters)
            .map { (searchQuery, characters) in
                characters.filter {
                    searchQuery.isEmpty ? true : $0.name
                        .localizedCaseInsensitiveContains(searchQuery)
                }
            }
            .assign(to: &$filteredCharacters)
    }
    
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
                self?.characters = value
            })
            .store(in: &cancellables)
    }
}
