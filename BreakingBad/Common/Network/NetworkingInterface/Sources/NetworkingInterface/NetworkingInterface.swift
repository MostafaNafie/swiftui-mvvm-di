import Combine
import Foundation

public struct HttpResponse<T> {
    public init(value: T, response: URLResponse) {
        self.value = value
        self.response = response
    }
    
    public let value: T
    let response: URLResponse
}

public protocol HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<HttpResponse<T>, Error>
}
