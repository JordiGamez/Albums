import Foundation
import RxSwift

/// Abstraction for RemoteDataSource
protocol RemoteDataSourceProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums>
}
