//
//  BreakingBadApp.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Swinject

@main
struct BreakingBadApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterList(viewModel: Container.CharactersListContainer.resolve(CharacterListViewModel.self)!)
        }
    }
}
