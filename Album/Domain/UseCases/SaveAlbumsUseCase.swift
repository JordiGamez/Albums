import Foundation
import RxSwift

/// Use case responsible for saving albums
class SaveAlbumsUseCase {
    
    // MARK: - Variables
    
    var provider: AlbumsProviderProtocol?
    
    // MARK: - Initializers
    
    init(provider: AlbumsProviderProtocol) {
        self.provider = provider
    }
}

// MARK: - SaveAlbumsUseCaseProtocol protocol conformance

extension SaveAlbumsUseCase: SaveAlbumsUseCaseProtocol {
    
    /// Save albums list
    ///
    /// - Parameter albums: Albums object
    func execute(albums: Albums) {
        provider?.saveAlbums(albums: albums)
    }
}
