import UIKit

class AlbumsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var customView: AlbumsView!
    
    // MARK: - Constants
    
    let customCellIdentifier = "AlbumsTableViewCellIdentifier"
    
    // MARK: - Variables
    
    var presenter: AlbumsPresenterProtocol?
    var albums: Albums?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.bind(view: self)
        presenter?.loadAlbums()
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

// MARK: - AlbumsViewProtocol protocol conformance

extension AlbumsViewController: AlbumsViewProtocol {
    
    
}
