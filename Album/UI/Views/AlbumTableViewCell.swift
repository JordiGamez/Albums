import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.accessibilityIdentifier = AccessibilityIdentifier.AlbumTableViewCell.albumTitleLabel.rawValue
            titleLabel.numberOfLines = 0
        }
    }
    
    // MARK: - Override methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
    }
}
