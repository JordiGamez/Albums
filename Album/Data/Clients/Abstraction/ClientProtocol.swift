import Foundation
import Alamofire
import RxSwift

/// Abstraction for Client
protocol ClientProtocol {
    
    /// Request
    ///
    /// - Parameters:
    ///   - url: url
    ///   - method: HTTPMethod
    ///   - parameters: Additional parameters
    ///   - encoding: ParameterEncoding
    ///   - headers: HTTPHeaders
    /// - Returns: Observable AlbumsEntity
    func request(url: String, method: HTTPMethod, parameters: [String: Any], encoding: ParameterEncoding, headers: HTTPHeaders?) -> Observable<AlbumsEntity>
    
    /// Request
    ///
    /// - Parameters:
    ///   - albumId: album id
    ///   - url: url
    ///   - method: HTTPMethod
    ///   - parameters: Additional parameters
    ///   - encoding: ParameterEncoding
    ///   - headers: HTTPHeaders
    /// - Returns: Observable PhotosEntity
    func request(albumId: Int, url: String, method: HTTPMethod, parameters: [String: Any], encoding: ParameterEncoding, headers: HTTPHeaders?) -> Observable<PhotosEntity>
}
