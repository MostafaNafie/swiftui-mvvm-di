//
//  CaptionView.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

struct CaptionView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding(5)
            .background(.white.opacity(0.75),
                        in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding(5)
    }
}

#Preview() {
    CaptionView(text: "Walter White")
        .background(.black)
}
