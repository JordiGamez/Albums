import Foundation

/// Abstraction for PhotosPresenter
protocol PhotosPresenterProtocol {
    
    /// Bind the view with the presenter
    ///
    /// - Parameter view: PhotosViewProtocol object
    func bind(view: PhotosViewProtocol)
    
    /// Load photos by album id
    ///
    /// - Parameter id: Album id
    func loadPhotosFromAlbumWith(id: Int)
    
    /// Open a url
    ///
    /// - Parameter url: The website url
    func open(url: String)
}
