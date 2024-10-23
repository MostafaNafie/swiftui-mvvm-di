//
//  CharacterRowView.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Kingfisher

struct CharacterRowView: View {
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
                CaptionView(text: character.name)
                    .opacity(0.75)
            }
            .overlay(alignment: .center) {
                ProgressView()
                    .isHidden(!isAnimating)
            }
            .cornerRadius(14)
    }
}

#Preview {
    CharacterRowView(character: .preview)
}
