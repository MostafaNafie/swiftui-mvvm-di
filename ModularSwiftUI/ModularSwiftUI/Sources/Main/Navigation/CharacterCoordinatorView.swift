//
//  CharacterCoordinatorView.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI
import CharacterList
import CharacterDetails

struct CharacterCoordinatorView: View {
    @Bindable var coordinator: CharacterCoordinator

    var body: some View {
        NavigationView {
            CharacterListScreen(viewModel: coordinator.viewModel!)
                .navigation(item: $coordinator.detailViewModel) { viewModel in
                    CharacterDetailsScreen(viewModel: viewModel)
                }
        }
    }
}
