import Foundation
import RxSwift

protocol ApiClientProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: AlbumsEntity Observable
    func getAlbums() -> Observable<AlbumsEntity>
}
