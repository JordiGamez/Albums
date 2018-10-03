import UIKit

class AlbumsView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.accessibilityIdentifier = AccessibilityIdentifier.AlbumsView.contentView.rawValue
        }
    }
    @IBOutlet weak var albumsTableView: UITableView! {
        didSet {
            albumsTableView.accessibilityIdentifier = AccessibilityIdentifier.AlbumsView.albumsTableView.rawValue
            albumsTableView.isHidden = true
            albumsTableView.register(UINib(nibName: cellView, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        }
    }
    
    // MARK: - Constants
    
    let viewName = "AlbumsView"
    let cellView = "AlbumsViewTableViewCell"
    let cellIdentifier = "AlbumsTableViewCellIdentifier"
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Override methods
    
    override func awakeFromNib() {
        Bundle.main.loadNibNamed(viewName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
