import Foundation
import RxSwift

/// Use case responsible for loading photos
class LoadPhotosUseCase {
    
    // MARK: - Variables
    
    var provider: PhotosProviderProtocol?
    
    // MARK: - Initializers
    
    init(provider: PhotosProviderProtocol) {
        self.provider = provider
    }
}

// MARK: - LoadPhotosUseCaseProtocol protocol conformance

extension LoadPhotosUseCase: LoadPhotosUseCaseProtocol {
    
    /// Executes the use case
    ///
    /// - Parameter albumId: Album id
    /// - Returns: Photos Observable
    func execute(albumId: Int) -> Observable<Photos> {
        return (provider?.getPhotosFromAlbum(id: albumId))!
    }
}
