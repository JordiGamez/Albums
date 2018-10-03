import Foundation

/// Accessibility identifier for all UI elements
enum AccessibilityIdentifier {
    
    enum AlbumsView: String {
        case contentView                = "AlbumsView_contentView"
        case albumsTableView            = "AlbumsView_albumsTableView"
    }
    
    enum AlbumsViewTableViewCell: String {
        case albumNameLabel             = "AlbumsViewTableViewCell_albumNameLabel"
    }
}
