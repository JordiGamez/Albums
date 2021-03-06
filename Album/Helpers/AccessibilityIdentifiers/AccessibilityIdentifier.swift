import Foundation

/// Accessibility identifier for all UI elements
enum AccessibilityIdentifier {
    
    enum AlbumsView: String {
        case contentView                    = "AlbumsView_contentView"
        case albumsTableView                = "AlbumsView_albumsTableView"
        case albumsActivityIndicatorView    = "AlbumsView_albumsActivityIndicatorView"
        case noInternetConnectionLabel      = "AlbumsView_noInternetConnectionLabel"
    }
    
    enum AlbumTableViewCell: String {
        case albumTitleLabel                = "AlbumTableViewCell_albumTitleLabel"
    }
    
    enum PhotosView: String {
        case contentView                    = "PhotosView_contentView"
        case photosCollectionView           = "PhotosView_photosCollectionView"
    }
    
    enum PhotoCollectionViewCell: String {
        case photoTitleLabel                = "PhotoCollectionViewCell_photoTitleLabel"
        case photoImageView                 = "PhotoCollectionViewCell_photoImageView"
    }
}
