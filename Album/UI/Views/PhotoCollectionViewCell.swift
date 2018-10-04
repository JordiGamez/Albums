import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.accessibilityIdentifier = AccessibilityIdentifier.PhotoCollectionViewCell.photoTitleLabel.rawValue
            titleLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.accessibilityIdentifier = AccessibilityIdentifier.PhotoCollectionViewCell.photoImageView.rawValue
        }
    }
    
    // MARK: - Variable
    
    var url: String?
    
    // MARK: - Override methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
