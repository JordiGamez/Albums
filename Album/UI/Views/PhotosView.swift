import UIKit

class PhotosView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.accessibilityIdentifier = AccessibilityIdentifier.PhotosView.contentView.rawValue
        }
    }
    
    // MARK: - Constants
    
    let viewName = "PhotosView"
    
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
