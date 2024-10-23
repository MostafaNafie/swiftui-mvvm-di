//
//  HTTPClient.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation

public protocol HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) async -> Result<T, Error>
}
