import Foundation
import RxSwift

class AlbumsPresenter {
    
    // MARK: - Variables
    
    var view: AlbumsViewProtocol?
    var loadAlbumsUseCase: LoadAlbumsUseCaseProtocol?
    
    // MARK: - Initializers
    
    init(loadAlbumsUseCase: LoadAlbumsUseCaseProtocol) {
        self.loadAlbumsUseCase = loadAlbumsUseCase
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
            }, onError: { error in
                DispatchQueue.main.async {
                    
                }
            }
        )
    }
}
