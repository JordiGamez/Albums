import Foundation
import RxSwift

class AlbumsProvider {
    
    // MARK: - Variables
    
    var remoteDataSource: RemoteDataSourceProtocol?
    var localDataSource: LocalDataSourceProtocol?
    var networkProvider: NetworkProviderProtocol?
    
    // MARK: - Initializers
    
    init(remoteDataSource: RemoteDataSourceProtocol, localDataSource: LocalDataSourceProtocol, networkProvider: NetworkProviderProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
        self.networkProvider = networkProvider
    }
}

// MARK: - AlbumsProviderProtocol protocol conformance

extension AlbumsProvider: AlbumsProviderProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums> {
        if (networkProvider?.hasInternetConnection())! {
            return (remoteDataSource?.getAlbums())!
        } else {
            return (localDataSource?.getAlbums())!
        }
    }
    
    /// Save albums list
    ///
    /// - Parameter albums: Albums list
    func saveAlbums(albums: Albums) {
        localDataSource?.saveAlbums(albums: albums)
    }
}
