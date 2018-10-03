import Foundation
import RxSwift

protocol AlbumsProviderProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums>
}
