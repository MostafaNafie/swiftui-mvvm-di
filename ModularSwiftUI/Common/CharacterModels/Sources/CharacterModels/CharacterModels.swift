//
//  CharacterModels.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation

public struct Character: Identifiable {
    public init(id: Int, name: String, imageUrl: URL, nickname: String, birthday: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.nickname = nickname
        self.birthday = birthday
    }
    
    public let id: Int
    public let name: String
    public let imageUrl: URL
    public let nickname: String
    public let birthday: String
}
