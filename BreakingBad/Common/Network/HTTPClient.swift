//
//  HTTPClient.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation

struct HttpResponse<T> {
    let value: T
    let response: URLResponse
}

protocol HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<HttpResponse<T>, Error>
}
