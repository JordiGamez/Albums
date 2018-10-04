import Foundation
import RxSwift

/// Presenter for AlbumsViewController
class AlbumsPresenter {
    
    // MARK: - Variables
    
    var view: AlbumsViewProtocol?
    var loadAlbumsUseCase: LoadAlbumsUseCaseProtocol?
    var saveAlbumsUseCase: SaveAlbumsUseCaseProtocol?
    
    // MARK: - Initializers
    
    init(loadAlbumsUseCase: LoadAlbumsUseCaseProtocol, saveAlbumsUseCase: SaveAlbumsUseCaseProtocol) {
        self.loadAlbumsUseCase = loadAlbumsUseCase
        self.saveAlbumsUseCase = saveAlbumsUseCase
    }
}

// MARK: - AlbumsPresenterProtocol protocol conformance

extension AlbumsPresenter: AlbumsPresenterProtocol {
    
    /// Bind the view with the presenter
    ///
    /// - Parameter view: AlbumsViewProtocol object
    func bind(view: AlbumsViewProtocol) {
        self.view = view
    }
    
    /// Load albums
    func loadAlbums() {
        _ = loadAlbumsUseCase?.execute().subscribe(
            onNext: { response in
                DispatchQueue.main.async {
                    self.view?.display(list: response)
                }
                // Save albums list to CoreData
                self.saveAlbumsUseCase?.execute(albums: response)
            }, onError: { error in
                DispatchQueue.main.async {
                    self.view?.showError()
                }
            }
        )
    }
    
    /// Perform segue
    ///
    /// - Parameter id: Album id
    func performSegueWith(id: Int) {
        self.view?.goToPhotosScreenWith(id: id)
    }
}
