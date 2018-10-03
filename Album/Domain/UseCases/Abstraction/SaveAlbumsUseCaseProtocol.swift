import Foundation

protocol SaveAlbumsUseCaseProtocol {
    
    /// Save albums list
    ///
    /// - Parameter albums: Albums object
    func execute(albums: Albums)
}
