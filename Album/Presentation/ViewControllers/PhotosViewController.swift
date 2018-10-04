import UIKit

/// Display a list of photos
class PhotosViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var customView: PhotosView!
    
    // MARK: - Constants
    
    
    
    // MARK: - Variables
    
    var presenter: PhotosPresenterProtocol?
    var albums: Photos?
    var albumId: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Album \(albumId)"
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        presenter?.bind(view: self)
        presenter?.loadPhotosFromAlbumWith(id: albumId)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - PhotosViewProtocol protocol conformance

extension PhotosViewController: PhotosViewProtocol {
    
    
}
