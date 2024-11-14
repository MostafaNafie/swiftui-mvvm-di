//
//  NetworkingResponse.swift
//  
//
//  Created by Mostafa Nafie on 30/09/2022.
//

import Foundation

public struct NetworkingResponse<T> {
    public init(value: T, response: URLResponse) {
        self.value = value
        self.response = response
    }

    public let value: T
    let response: URLResponse
}
