import Foundation
import Alamofire
import RxSwift

class ApiClient {
    
    // MARK: - Variables
    
    var client: ClientProtocol?
    var url = Values.Server.Api.url
    
    // MARK: - Initializers
    
    init(client: ClientProtocol) {
        self.client = client
    }
}

// MARK: - ApiClientProtocol protocol conformance

extension ApiClient: ApiClientProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: AlbumsEntity Observable
    func getAlbums() -> Observable<AlbumsEntity> {
        let endpoint = "/albums"
        
        return (client?.request(url: url + endpoint, method: .get, parameters: [:], encoding: URLEncoding.default, headers: nil))!
    }
}
