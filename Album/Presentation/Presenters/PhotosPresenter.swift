import Foundation
import RxSwift

/// Presenter for PhotosViewController
class PhotosPresenter {
    
    // MARK: - Variables
    
    var view: PhotosViewProtocol?
    var loadPhotosUseCase: LoadPhotosUseCaseProtocol?
    
    // MARK: - Initializers
    
    init(loadPhotosUseCase: LoadPhotosUseCaseProtocol) {
        self.loadPhotosUseCase = loadPhotosUseCase
    }
}

// MARK: - PhotosPresenterProtocol protocol conformance

extension PhotosPresenter: PhotosPresenterProtocol {
    
    /// Bind the view with the presenter
    ///
    /// - Parameter view: PhotosViewProtocol object
    func bind(view: PhotosViewProtocol) {
        self.view = view
    }
    
    /// Load photos by album id
    ///
    /// - Parameter id: Album id
    func loadPhotosFromAlbumWith(id: Int) {
        _ = loadPhotosUseCase?.execute(albumId: id).subscribe(
            onNext: { response in
                DispatchQueue.main.async {
                    
                }
            }, onError: { error in
                DispatchQueue.main.async {
                    
                }
            }
        )
    }
}
