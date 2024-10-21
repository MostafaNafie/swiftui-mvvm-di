//
//  URLSessionClient.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation
import Common

public struct URLSessionClient: HTTPClient {
    public init() {}
    
    public func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<NetworkingResponse<T>, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .retry(3)
            .tryMap{result -> NetworkingResponse<T> in
                let item: T = try JSONDecoder().decode(T.self, from: result.data)
                return NetworkingResponse(value: item, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
