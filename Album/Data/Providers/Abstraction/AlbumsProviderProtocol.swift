import Foundation
import RxSwift

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
