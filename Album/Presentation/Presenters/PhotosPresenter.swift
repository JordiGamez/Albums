import Foundation
import RxSwift

/// Presenter for PhotosViewController
class PhotosPresenter {
    
    // MARK: - Variables
    
    var view: PhotosViewProtocol?
    var loadPhotosUseCase: LoadPhotosUseCaseProtocol?
    var networkProvider: NetworkProviderProtocol?
    
    // MARK: - Initializers
    
    init(loadPhotosUseCase: LoadPhotosUseCaseProtocol, networkProvider: NetworkProviderProtocol) {
        self.loadPhotosUseCase = loadPhotosUseCase
        self.networkProvider = networkProvider
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
                    self.view?.display(list: response)
                }
            }, onError: { error in
                DispatchQueue.main.async {
                    self.view?.showError()
                }
            }
        )
    }
    
    /// Open a url
    ///
    /// - Parameter url: The website url
    func open(url: String) {
        if (networkProvider?.hasInternetConnection())! {
            if let url = URL(string: url) {
                self.view?.open(url: url)
            }
        } else {
            self.view?.showError()
        }
    }
}
