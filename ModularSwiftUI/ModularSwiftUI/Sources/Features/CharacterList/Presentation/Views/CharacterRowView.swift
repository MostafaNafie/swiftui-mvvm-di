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

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(
            character: .init(
                id: 1,
                name: "Walter White",
                imageUrl: URL(
                    string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"
                )!
            )
        )
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
