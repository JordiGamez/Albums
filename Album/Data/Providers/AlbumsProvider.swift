import Foundation
import RxSwift

class AlbumsProvider {
    
    // MARK: - Variables
    
    var remoteDataSource: RemoteDataSourceProtocol?
    
    // MARK: - Initializers
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - AlbumsProviderProtocol protocol conformance

extension AlbumsProvider: AlbumsProviderProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums> {
        return (remoteDataSource?.getAlbums())!
    }
}
