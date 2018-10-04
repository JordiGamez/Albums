import UIKit

class PhotosView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.accessibilityIdentifier = AccessibilityIdentifier.PhotosView.contentView.rawValue
        }
    }
    @IBOutlet weak var photosCollectionView: UICollectionView! {
        didSet {
            photosCollectionView.accessibilityIdentifier = AccessibilityIdentifier.PhotosView.photosCollectionView.rawValue
            photosCollectionView.isHidden = true
            photosCollectionView.register(UINib(nibName: cellView, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        }
    }
    
    // MARK: - Constants
    
    let viewName = "PhotosView"
    let cellView = "PhotoCollectionViewCell"
    let cellIdentifier = "PhotoCollectionViewCellIdentifier"
    
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
    
    // MARK: - Public methods
    
    /// Reload collection data
    func reloadCollection() {
        photosCollectionView.reloadData()
        photosCollectionView.isHidden = false
    }
}
