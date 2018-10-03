import Foundation
import RxSwift

class LoadAlbumsUseCase {
    
    // MARK: - Variables
    
    var provider: AlbumsProviderProtocol?
    
    // MARK: - Initializers
    
    init(provider: AlbumsProviderProtocol) {
        self.provider = provider
    }
}

// MARK: - LoadAlbumsUseCaseProtocol protocol conformance

extension LoadAlbumsUseCase: LoadAlbumsUseCaseProtocol {
    
    /// Executes the use case
    ///
    /// - Returns: Albums Observable
    func execute() -> Observable<Albums> {
        return (provider?.getAlbums())!
    }
}
