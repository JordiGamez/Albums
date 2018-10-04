import Foundation

/// Abstraction for SaveAlbumsUseCase
protocol SaveAlbumsUseCaseProtocol {
    
    /// Save albums list
    ///
    /// - Parameter albums: Albums object
    func execute(albums: Albums)
}
