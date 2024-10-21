//
//  CharacterDetailsViewModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Observation

@Observable
public final class CharacterDetailsViewModel {
    var character: Character!

    private var id: Int
    private let characterDetailsUseCase: CharacterDetailsUseCase

    public init(
        id: Int,
        characterDetailsUseCase: CharacterDetailsUseCase
    ) {
        self.id = id
        self.characterDetailsUseCase = characterDetailsUseCase
        
        fetchCharacter()
    }
}

private extension CharacterDetailsViewModel {
    func fetchCharacter() {
        character = characterDetailsUseCase.getCharacter(with: id)
    }
}
