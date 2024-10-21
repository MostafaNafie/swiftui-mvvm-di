//
//  Character.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation

public struct Character: Identifiable {
    public let id: Int
    public let name: String
    public let imageUrl: URL

    public init(id: Int, name: String, imageUrl: URL) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
}
