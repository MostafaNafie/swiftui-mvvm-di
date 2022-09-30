//
//  File.swift
//  
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
        let baseURL = URL(string: "https://breakingbadapi.com/api")!
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
