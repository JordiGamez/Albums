import Foundation

/// Abstraction for PhotosViewController
protocol PhotosViewProtocol {
    
    /// Display the list of photos
    ///
    /// - Parameter list: Photos list
    func display(list: Photos)
    
    /// Show error
    func showError()
    
    /// Open the URL
    ///
    /// - Parameter url: The website url
    func open(url: URL)
}
