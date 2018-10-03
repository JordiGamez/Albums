import Foundation
import RxSwift

protocol RemoteDataSourceProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums>
}
