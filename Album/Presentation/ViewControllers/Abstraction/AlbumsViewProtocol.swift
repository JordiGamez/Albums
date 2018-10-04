import Foundation

/// Abstraction for AlbumsViewController
protocol AlbumsViewProtocol {
    
    /// Display the list of albums
    ///
    /// - Parameter list: Albums list
    func display(list: Albums)
    
    /// Show error
    func showError()
}
