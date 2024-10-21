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

    private let characterDetailsUseCase: CharacterDetailsUseCase

    public init(
        characterDetailsUseCase: CharacterDetailsUseCase
    ) {
        self.characterDetailsUseCase = characterDetailsUseCase
    }

    func viewDidLoad() {
        getSelectedCharacter()
    }
}

private extension CharacterDetailsViewModel {
    func getSelectedCharacter() {
        character = characterDetailsUseCase.getSelectedCharacter()
    }
}
