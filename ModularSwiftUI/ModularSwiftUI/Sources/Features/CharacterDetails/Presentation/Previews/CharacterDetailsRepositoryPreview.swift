//
//  CharacterDetailsViewModelPreview.swift
//  ModularSwiftUI
//
//  Created by Nafie on 23/10/2024.
//

import Foundation

extension CharacterDetailsViewModel {
    @MainActor static let preview = CharacterDetailsViewModel(
        interactor: .init(repository: CharacterDetailsRepositoryPreview())
    )

    actor CharacterDetailsRepositoryPreview: CharacterDetailsRepositoryProtocol {
        func getSelectedCharacter() -> Character {
            Character(
                name: "Walter White",
                // swiftlint:disable:next line_length
                imageUrl: .init(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"
                )!,
                nickname: "Walter",
                birthday: "23/23/23"
            )
        }
    }
}
