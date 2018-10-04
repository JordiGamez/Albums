import Foundation

/// Abstraction for AlbumsViewController
protocol AlbumsViewProtocol {
    
    /// Display the list of albums
    ///
    /// - Parameter list: Albums list
    func display(list: Albums)
    
    /// Show error
    func showError()
    
    /// Go to photos screen
    ///
    /// - Parameter id: Album id
    func goToPhotosScreenWith(id: Int)
}
