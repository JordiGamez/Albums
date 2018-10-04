import Foundation
import RxSwift

/// Abstraction for LoadAlbumsUseCase
protocol LoadAlbumsUseCaseProtocol {
    
    /// Executes the use case
    ///
    /// - Returns: Albums Observable
    func execute() -> Observable<Albums>
}
