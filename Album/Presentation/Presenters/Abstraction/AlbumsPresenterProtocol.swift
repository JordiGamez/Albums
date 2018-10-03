import Foundation

protocol AlbumsPresenterProtocol {
    
    /// Bind the view with the presenter
    ///
    /// - Parameter view: AlbumsViewProtocol object
    func bind(view: AlbumsViewProtocol)
    
    /// Load albums
    func loadAlbums()
}
