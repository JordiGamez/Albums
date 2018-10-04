import Foundation
import RxSwift

/// Abstraction for LoadPhotosUseCase
protocol LoadPhotosUseCaseProtocol {
    
    /// Executes the use case
    ///
    /// - Parameter albumId: Album id
    /// - Returns: Photos Observable
    func execute(albumId: Int) -> Observable<Photos>
}
