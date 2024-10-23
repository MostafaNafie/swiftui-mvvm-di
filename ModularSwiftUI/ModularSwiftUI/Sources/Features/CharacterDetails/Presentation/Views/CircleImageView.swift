//
//  CircleImageView.swift
//  Landmarks
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Kingfisher

struct CircleImageView: View {
    var imageUrl: URL
    
    var body: some View {
        KFImage(imageUrl)
            .resizable()
            .scaledToFill()
            .frame(width: 300, alignment: .top)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImageView(imageUrl: .preview)
}
