import Foundation
import RxSwift

/// Abstraction for AlbumsProvider
protocol AlbumsProviderProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums>
    
    /// Save albums list
    ///
    /// - Parameter albums: Albums list
    func saveAlbums(albums: Albums)
}
