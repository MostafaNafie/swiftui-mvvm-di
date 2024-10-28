//
//  CharacterDetailsViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Observation

@Observable
public final class CharacterDetailsViewModel {
    var character: Character = .empty

    private let interactor: CharacterDetailsInteractor

    public init(
        interactor: CharacterDetailsInteractor
    ) {
        self.interactor = interactor
    }

    @MainActor
    func viewDidLoad() async {
        await getSelectedCharacter()
    }
}

private extension CharacterDetailsViewModel {
    @MainActor
    func getSelectedCharacter() async {
        character = await interactor.getSelectedCharacter()
    }
}
