//
//  CharacterDetailsViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Observation

@Observable
public final class CharacterDetailsViewModel {
    var character: Character?

    private let interactor: CharacterDetailsInteractor

    init(
        interactor: CharacterDetailsInteractor
    ) {
        self.interactor = interactor
    }

    func viewDidLoad() {
        getSelectedCharacter()
    }
}

private extension CharacterDetailsViewModel {
    func getSelectedCharacter() {
        character = interactor.getSelectedCharacter()
    }
}
