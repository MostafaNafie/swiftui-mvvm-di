//
//  URLSessionClient.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Foundation

struct URLSessionClient: HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) async -> Result<T, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let item: T = try JSONDecoder().decode(T.self, from: data)
            return .success(item)
        } catch {
            return .failure(error)
        }
    }
}
