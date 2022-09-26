//
//  CharacterListViewModel.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation

final class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    private let networkService: CharacterListNetworkServicing
    private var cancellable: AnyCancellable? = nil
    
    init(networkService: CharacterListNetworkServicing) {
        self.networkService = networkService
    }
    
    func fetchCharacters() {
        self.cancellable = self.networkService.fetchCharacters()
            .map{ charactersResponse in
                charactersResponse.map { Character(id: $0.id, name: $0.name, imageUrl: URL(string: $0.img)!) }
            }
            .sink( receiveCompletion: { [weak self] completion in
                switch completion {
                    case .failure:
                        print("Failure")
                    case .finished:
                        print("Success")
                }
                self?.cancellable?.cancel()
            }, receiveValue: { value in
                self.characters = value
            })
    }
}