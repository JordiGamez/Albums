import Foundation
import RxSwift

/// Responsible for providing phtos
class PhotosProvider {
    
    // MARK: - Variables
    
    var remoteDataSource: RemoteDataSourceProtocol?
    
    // MARK: - Initializers
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - PhotosProviderProtocol protocol conformance

extension PhotosProvider: PhotosProviderProtocol {

    /// Get the photos list
    ///
    /// - Parameter albumId: Album id
    /// - Returns: Photos Observable
    func getPhotosFromAlbum(id: Int) -> Observable<Photos> {
        return (remoteDataSource?.getPhotosFromAlbum(id: id))!
    }
}
