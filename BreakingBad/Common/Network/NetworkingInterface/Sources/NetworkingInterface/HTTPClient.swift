import Combine
import Foundation

public protocol HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<NetworkingResponse<T>, Error>
}
