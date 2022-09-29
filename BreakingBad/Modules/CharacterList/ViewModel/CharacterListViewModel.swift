//
//  CharacterListViewModel.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation

protocol CharacterCoordinating: AnyObject {
    func open(_ character: Character)
}

final class CharacterListViewModel: ObservableObject {
    @Published var filteredCharacters: [Character] = []
    @Published var searchQuery: String = ""
    
    @Published private var characters: [Character] = []
    private let networkService: CharacterListNetworkServicing
    private let coordinator: CharacterCoordinating?
    private var cancellables: [AnyCancellable] = []
    
    init(networkService: CharacterListNetworkServicing,
         coordinator: CharacterCoordinating? = nil) {
        self.networkService = networkService
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
        networkService.fetchCharacters()
            .print(#function)
            .map{ charactersResponse in
                charactersResponse.map {
                    Character(id: $0.id,
                              name: $0.name,
                              imageUrl: URL(string: $0.img)!,
                              nickname: $0.nickname,
                              birthday: $0.birthday)
                }
            }
            .sink( receiveCompletion: { completion in
                switch completion {
                    case .failure:
                        print("Failure")
                    case .finished:
                        print("Success")
                }
            }, receiveValue: { value in
                self.characters = value
                self.filteredCharacters = value
            })
            .store(in: &cancellables)
    }
    
    func searchQueryChanged(_ searchQuery: String) {
        filteredCharacters = characters.filter {
            searchQuery.isEmpty ? true : $0.name
                .localizedCaseInsensitiveContains(searchQuery)
        }
    }
}
