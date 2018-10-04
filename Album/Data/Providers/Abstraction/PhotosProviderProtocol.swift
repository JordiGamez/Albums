import Foundation
import RxSwift

/// Abstraction for PhotosProvider
protocol PhotosProviderProtocol {
    
    /// Get the photos list
    ///
    /// - Parameter albumId: Album id
    /// - Returns: Photos Observable
    func getPhotosFromAlbum(id: Int) -> Observable<Photos>
}
