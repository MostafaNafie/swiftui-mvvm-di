//
//  URLSessionClient.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation
import NetworkingInterface

struct URLSessionClient: HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<HttpResponse<T>, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .retry(3)
            .tryMap{result -> HttpResponse<T> in
                let item: T = try JSONDecoder().decode(T.self, from: result.data)
                return HttpResponse(value: item, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
