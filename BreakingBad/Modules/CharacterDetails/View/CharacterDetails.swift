//
//  CharacterDetails.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import SwiftUI
import Kingfisher

struct CharacterDetails: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        ScrollView {
            KFImage(viewModel.character.imageUrl)
                .resizable()
                .ignoresSafeArea(edges: .top)
                .scaledToFill()
                .frame(height: 400, alignment: .top)
                .overlay {
                    Rectangle()
                        .opacity(0.5)
                }
                .clipped()
            
            CircleImage(imageUrl: viewModel.character.imageUrl)
                .offset(y: -225)
                .padding(.bottom, -280)
            
            VStack(alignment: .center) {
                HStack {
                    Text(viewModel.character.name)
                        .font(.title)
                }
                
                Divider()
                
                Text("About \(viewModel.character.name)")
                    .font(.title2)
                    .padding()
                Text("Nickname: \(viewModel.character.nickname)")
                    .font(.body)
                Text("Birthday: \(viewModel.character.birthday)")
                    .font(.body)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(id: 1, name: "Walter White", imageUrl: .init(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!, nickname: "Walter", birthday: "23/23/23")
        CharacterDetails(viewModel: .init(character: character))
    }
}
