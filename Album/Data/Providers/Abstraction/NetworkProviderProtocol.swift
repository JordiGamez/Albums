import Foundation

protocol NetworkProviderProtocol {
    
    /// Check if device has Internet connection
    ///
    /// - Returns: True if has connection, false otherwise
    func hasInternetConnection() -> Bool
}
