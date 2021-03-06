import Foundation
import Alamofire
import RxSwift

/// Responsible for the communication with the API
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
    
    /// Get the photos list
    ///
    /// - Parameter id: Album id
    /// - Returns: PhotosEntity Observable
    func getPhotosFromAlbum(id: Int) -> Observable<PhotosEntity> {
        let endpoint = "/photos"
        
        return (client?.request(albumId: id, url: url + endpoint, method: .get, parameters: [:], encoding: URLEncoding.default, headers: nil))!
    }
}
