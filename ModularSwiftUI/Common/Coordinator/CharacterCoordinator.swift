//
//  File.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI
import Observation
import Swinject
import CharacterList
import CharacterDetails
import CharacterModels

@Observable
class CharacterCoordinator: Identifiable, CharacterCoordinating {
    var viewModel: CharacterListViewModel? = nil
    var detailViewModel: CharacterDetailsViewModel? = nil
    
    func start() {
        viewModel = Container.CharactersListContainer.resolve(CharacterListViewModel.self)!
    }

    func open(_ character: Character) {
        detailViewModel = Container.CharacterDetailsContainer.resolve(CharacterDetailsViewModel.self,
                                                                      argument: character)
    }
}
