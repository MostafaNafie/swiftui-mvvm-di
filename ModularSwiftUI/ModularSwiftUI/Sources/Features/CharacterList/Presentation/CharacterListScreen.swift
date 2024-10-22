//
//  CharacterListScreen.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Common
import Combine

public struct CharacterListScreen: View {
    @Bindable private var viewModel: CharacterListViewModel

    public init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List($viewModel.filteredCharacters) { character in
            CharacterRowView(character: character.wrappedValue)
                .listRowSeparator(.hidden)
                .onNavigation {
                    viewModel.didTapCharacter(with: character.wrappedValue.id)
                }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Breaking Bad")
        .onViewDidLoad {
            viewModel.viewDidLoad()
        }
        .searchable(text: $viewModel.searchQuery, prompt: "Search Characters by Name")
        .onChange(of: viewModel.searchQuery) { _, query in
            viewModel.reloadCharacters()
        }
        .errorAlert(error: $viewModel.error)
    }
}

struct CharacterList_Previews: PreviewProvider {
    static let viewModel = CharacterListViewModel(
        interactor: .init(repository: PreviewCharacterListRepository())
    )
    
    static var previews: some View {
        CharacterListScreen(viewModel: viewModel)
    }

    struct PreviewCharacterListRepository: CharacterListRepositoryProtocol {
        func setSelectedCharacter(with id: Int) {}
        
        func getCharacters() -> AnyPublisher<[Character], any Error> {
            let fakeCharacters: [Character] = [
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
            ]
            return Just(fakeCharacters)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}


