//
//  CircleImage.swift
//  Landmarks
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Kingfisher

struct CircleImage: View {
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

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageUrl: .init(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!)
    }
}
