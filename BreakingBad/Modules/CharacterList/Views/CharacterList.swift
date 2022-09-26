//
//  CharacterList.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

struct CharacterList: View {
    let characters: [Character] = [Character(id: 1), Character(id: 2), Character(id: 3), Character(id: 4), Character(id: 5)]
    
    var body: some View {
        List {
            ForEach(characters) { item in
                CharacterRow()
                    .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}
