import Foundation
import RxSwift

protocol LoadAlbumsUseCaseProtocol {
    
    /// Executes the use case
    ///
    /// - Returns: Albums Observable
    func execute() -> Observable<Albums>
}
