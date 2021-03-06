import Foundation
import RxSwift

/// Abstraction for RemoteDataSource
protocol RemoteDataSourceProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums>
    
    /// Get the photos list
    ///
    /// - Parameter albumId: Album id
    /// - Returns: <Photos> Observable
    func getPhotosFromAlbum(id: Int) -> Observable<Photos>
}
