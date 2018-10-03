import Foundation
import Alamofire
import RxSwift

class Client {
    
    init() {}
}

// MARK: - ClientProtocol protocol conformance

extension Client: ClientProtocol {
    
    /// Request
    ///
    /// - Parameters:
    ///   - url: url
    ///   - method: HTTPMethod
    ///   - parameters: Additional parameters
    ///   - encoding: ParameterEncoding
    ///   - headers: HTTPHeaders
    /// - Returns: Observable AlbumsEntity
    func request(url: String, method: HTTPMethod, parameters: [String: Any], encoding: ParameterEncoding, headers: HTTPHeaders?) -> Observable<AlbumsEntity> {
        
        return Observable<AlbumsEntity>.create{ observer in
            
            Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseData() { response in
                
                var albumsArray = [AlbumEntity]()
                
                if let data = response.result.value {
                    // Decoder
                    albumsArray = try! JSONDecoder().decode([AlbumEntity].self, from: data)
                }
                
                switch response.result {
                case .success:
                    observer.on(.next(AlbumsEntity(albums: albumsArray)))
                    observer.onCompleted()
                case .failure(let error):
                    observer.on(.error(error))
                }
            }
            
            return Disposables.create()
        }
    }
}
