import Foundation

/// Abstraction for AlbumsPresenter
protocol AlbumsPresenterProtocol {
    
    /// Bind the view with the presenter
    ///
    /// - Parameter view: AlbumsViewProtocol object
    func bind(view: AlbumsViewProtocol)
    
    /// Load albums
    func loadAlbums()
    
    /// Perform segue
    ///
    /// - Parameter id: Album id
    func performSegueWith(id: Int)
}
