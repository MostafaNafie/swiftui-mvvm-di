//
//  CharacterListViewModelPreview.swift
//  ModularSwiftUI
//
//  Created by Nafie on 23/10/2024.
//

import Foundation

extension CharacterListViewModel {
    static let preview = CharacterListViewModel(
        interactor: .init(repository: CharacterListRepositoryPreview()),
        coordinator: CharacterCoordinatorPreview()
    )

    struct CharacterListRepositoryPreview: CharacterListRepositoryProtocol {
        func getCharacters() async -> Result<[Character], any Error> {
            .success([
                .init(
                    id: 1,
                    name: "Walter White",
                    imageUrl: URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!
                ),
                .init(
                    id: 2,
                    name: "Jesse Pinkman",
                    imageUrl: URL(string: "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441")!
                ),
                .init(
                    id: 3,
                    name: "Henry Schrader",
                    imageUrl: URL(string: "https://vignette.wikia.nocookie.net/breakingbad/images/b/b7/HankS5.jpg/revision/latest/scale-to-width-down/700?cb=20120620014136")!
                )
            ])
        }

        func setSelectedCharacter(with id: Int) {}
    }

    class CharacterCoordinatorPreview: CharacterCoordinating {
        func didTapCharacter() {}
    }
}
