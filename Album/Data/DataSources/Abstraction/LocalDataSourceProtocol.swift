import Foundation
import RxSwift

protocol LocalDataSourceProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums>
    
    /// Save the albums list
    ///
    /// - Parameter albums: Albums list
    func saveAlbums(albums: Albums)
}
