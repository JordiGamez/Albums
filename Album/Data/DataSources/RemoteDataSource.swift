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
}
