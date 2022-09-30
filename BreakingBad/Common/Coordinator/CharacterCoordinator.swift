//
//  File.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI
import Swinject
import CharacterList
import CharacterDetails
import CharacterModels

class CharacterCoordinator: ObservableObject, Identifiable, CharacterCoordinating {
    @Published var viewModel: CharacterListViewModel?
    @Published var detailViewModel: CharacterDetailsViewModel?
    
    func start() {
        viewModel = Container.CharactersListContainer.resolve(CharacterListViewModel.self)!
    }

    func open(_ character: Character) {
        detailViewModel = Container.CharacterDetailsContainer.resolve(CharacterDetailsViewModel.self,
                                                                      argument: character)
    }
}
