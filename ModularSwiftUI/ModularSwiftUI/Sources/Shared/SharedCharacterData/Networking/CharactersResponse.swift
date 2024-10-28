//
//  DataModel.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation

public typealias CharactersResponse = [Character]

public struct Character: Codable, Sendable {
    let id: Int
    let name: String
    let birthday: String
    let occupation: [String]?
    let img: String
    let status: Status?
    let nickname: String
    let appearance: [Int]?
    let portrayed: String?
    let category: Category?
    let betterCallSaulAppearance: [Int]?

    enum Category: String, Codable {
        case betterCallSaul = "Better Call Saul"
        case breakingBad = "Breaking Bad"
        case breakingBadBetterCallSaul = "Breaking Bad, Better Call Saul"
    }

    enum Status: String, Codable {
        case alive = "Alive"
        case deceased = "Deceased"
        case presumedDead = "Presumed dead"
        case unknown = "Unknown"
    }

    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}

extension Character {
    func toListCharacter() -> CharacterList.Character {
        .init(
            id: id,
            name: name,
            imageUrl: URL(string: img)!
        )
    }

    func toDetailsCharacter() -> CharacterDetails.Character {
        .init(
            name: name,
            imageUrl: URL(string: img)!,
            nickname: nickname,
            birthday: birthday
        )
    }
}
