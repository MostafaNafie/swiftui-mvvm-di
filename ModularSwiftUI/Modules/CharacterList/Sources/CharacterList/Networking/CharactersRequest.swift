//
//  CharactersRequest.swift
//  
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation
import NetworkingInterface

struct CharactersRequest: NetworkingRequest {
  var path: String { "/characters" }
  var headers: [String: String] = [:]
}
