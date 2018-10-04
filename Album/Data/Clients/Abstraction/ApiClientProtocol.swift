import Foundation
import RxSwift

/// Abstraction for ApiClient
protocol ApiClientProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: AlbumsEntity Observable
    func getAlbums() -> Observable<AlbumsEntity>
    
    /// Get the photos list
    ///
    /// - Parameter id: Album id
    /// - Returns: PhotosEntity Observable
    func getPhotosFromAlbum(id: Int) -> Observable<PhotosEntity>
}
