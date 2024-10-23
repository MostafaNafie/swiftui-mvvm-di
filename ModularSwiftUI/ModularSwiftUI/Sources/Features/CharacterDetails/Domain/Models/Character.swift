//
//  Character.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation

public struct Character: Equatable {
    public let name: String
    public let imageUrl: URL
    public let nickname: String
    public let birthday: String

    public init(name: String, imageUrl: URL, nickname: String, birthday: String) {
        self.name = name
        self.imageUrl = imageUrl
        self.nickname = nickname
        self.birthday = birthday
    }
}

extension Character {
    static let empty = Character(
        name: "",
        imageUrl: URL("")!,
        nickname: "",
        birthday: ""
    )
}
