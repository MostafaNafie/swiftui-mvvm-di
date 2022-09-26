//
//  CharacterRow.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Kingfisher

struct CharacterRow: View {
    let character: Character
    
    @State private var isAnimating = true
    
    var body: some View {
        KFImage(character.imageUrl)
            .fade(duration: 0.35)
            .onSuccess { _ in
                isAnimating = false
            }
            .resizable()
            .scaledToFill()
            .frame(height: 400, alignment: .top)
            .clipped()
            .overlay(alignment: .bottom) {
                Caption(text: character.name)
                    .opacity(0.75)
            }
            .overlay(alignment: .center) {
                ProgressView()
                    .isHidden(!isAnimating)
            }
            .cornerRadius(14)
            .padding(5)
            .background(.gray.opacity(0.25))
    }
    
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: .init(id: 1, name: "Walter White", imageUrl: URL(string: "https://vignette.wikia.nocookie.net/breakingbad/images/c/c1/4x11_-_Huell.png/revision/latest?cb=20130913100459&path-prefix=es")!))
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
