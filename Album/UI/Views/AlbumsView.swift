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
    @IBOutlet weak var albumsActivityIndicatorView: UIActivityIndicatorView! {
        didSet {
            albumsActivityIndicatorView.accessibilityIdentifier = AccessibilityIdentifier.AlbumsView.albumsActivityIndicatorView.rawValue
            albumsActivityIndicatorView.isHidden = false
            albumsActivityIndicatorView.startAnimating()
        }
    }
    @IBOutlet weak var noInternetConnectionLabel: UILabel! {
        didSet {
            noInternetConnectionLabel.accessibilityIdentifier = AccessibilityIdentifier.AlbumsView.noInternetConnectionLabel.rawValue
            noInternetConnectionLabel.isHidden = true
            noInternetConnectionLabel.numberOfLines = 0
            noInternetConnectionLabel.text = noInternetConnectionText
        }
    }
    
    // MARK: - Constants
    
    let viewName = "AlbumsView"
    let cellView = "AlbumTableViewCell"
    let cellIdentifier = "AlbumTableViewCellIdentifier"
    let noInternetConnectionText = "Error, no Internet connection available"
    
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
    
    // MARK: - Private methods
    
    /// Hide the activity indicador
    fileprivate func hideActivityIndicator() {
        hideNoInternetConnectionLabel()
        albumsActivityIndicatorView.stopAnimating()
        albumsActivityIndicatorView.isHidden = true
    }
    
    /// Hide the no Internet connection label
    fileprivate func hideNoInternetConnectionLabel() {
        noInternetConnectionLabel.isHidden = true
    }
    
    // MARK: - Public methods
    
    /// Reload table view
    func reloadTable() {
        hideNoInternetConnectionLabel()
        hideActivityIndicator()
        albumsTableView.reloadData()
        albumsTableView.isHidden = false
    }
    
    /// Show the no Internet connection label
    func showNoInternetConnectionLabel() {
        hideActivityIndicator()
        noInternetConnectionLabel.isHidden = false
    }
}
