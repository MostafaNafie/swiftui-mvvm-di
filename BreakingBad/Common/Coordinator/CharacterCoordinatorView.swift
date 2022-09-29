//
//  CharacterCoordinatorView.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import SwiftUI

struct CharacterCoordinatorView: View {
    @ObservedObject var coordinator: CharacterCoordinator

    var body: some View {
        NavigationView {
            CharacterList(viewModel: coordinator.viewModel!)
                .navigation(item: $coordinator.detailViewModel) { viewModel in
                    CharacterDetails(viewModel: viewModel)
                }
        }
    }
}
