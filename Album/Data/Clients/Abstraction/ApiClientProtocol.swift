import Foundation
import RxSwift

/// Abstraction for ApiClient
protocol ApiClientProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: AlbumsEntity Observable
    func getAlbums() -> Observable<AlbumsEntity>
}
