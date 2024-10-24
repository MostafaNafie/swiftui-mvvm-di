//
//  CharactersRequest.swift
//  
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation

struct CharactersRequest: NetworkingRequest {
  var path: String { "/BreakingBadCharacters" }
  var headers: [String: String] = [:]
}
