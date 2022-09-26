//
//  CharacterRow.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

struct CharacterRow: View {
    private let imageURL =  "https://vignette.wikia.nocookie.net/breakingbad/images/c/c1/4x11_-_Huell.png/revision/latest?cb=20130913100459&path-prefix=es"
    private let name = "Walter White"
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: 300, alignment: .top)
                .clipped()
                .overlay(alignment: .bottom) {
                    Caption(text: name)
                        .opacity(0.75)
                }
        } placeholder: {
            ProgressView()
        }
    }
    
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow()
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
