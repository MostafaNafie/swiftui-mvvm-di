//
//  NetworkingRequest.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation

public protocol NetworkingRequest {
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    func buildURLRequest() -> URLRequest
}

public extension NetworkingRequest {
    var method: HTTPMethod { .GET }
    var body: Data? { nil }

    func buildURLRequest() -> URLRequest {
        let baseURL =
            URL(
                string:  // swiftlint:disable:next line_length
                    "https://gist.githubusercontent.com/MostafaNafie/2873132c8b48f445d3e383b466966c08/raw/8e948b91043bff6223bafc1aac4b2d6d0f5d04ae"
            )!
        let pathURL = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: pathURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return urlRequest
    }
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}
