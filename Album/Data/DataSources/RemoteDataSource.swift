import Foundation
import RxSwift

/// Responsible for handling the connection with the remote data source
class RemoteDataSource {
    
    // MARK: - Variables
    
    var apiClient: ApiClientProtocol?
    
    // MARK: - Initializers
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
}

// MARK: - RemoteDataSourceProtocol protocol conformance

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums> {
        return ((apiClient?.getAlbums().map { entity -> Albums in
            let mapper = AlbumsMapper()
            return mapper.transform(entity)
        })!)
    }
    
    /// Get the photos list
    ///
    /// - Parameter id: Album id
    /// - Returns: PhotosEntity Observable
    func getPhotosFromAlbum(id: Int) -> Observable<Photos> {
        return ((apiClient?.getPhotosFromAlbum(id: id).map { entity -> Photos in
            let mapper = PhotosMapper()
            return mapper.transform(entity)
        })!)
    }
}
