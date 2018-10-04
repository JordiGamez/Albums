import UIKit
import Kingfisher

/// Display a list of photos
class PhotosViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var customView: PhotosView!
    
    // MARK: - Constants
    
    let customCellIdentifier = "PhotoCollectionViewCellIdentifier"
    
    // MARK: - Variables
    
    var presenter: PhotosPresenterProtocol?
    var photos: Photos?
    var albumId: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Album \(albumId)"
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        customView.photosCollectionView.dataSource = self
        customView.photosCollectionView.delegate = self
        
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
    
    /// Display the list of photos
    ///
    /// - Parameter list: Photos list
    func display(list: Photos) {
        photos = list
        customView.reloadCollection()
    }
    
    /// Show error
    func showError() {
        let alert = UIAlertController(title: "You are offline", message: "Please check your connection and try again", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /// Open the URL
    ///
    /// - Parameter url: The website url
    func open(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

// MARK: - UICollectionViewDataSource and UICollectionViewDelegate protocol conformance

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let photos = photos {
            return photos.list.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        if let photos = photos?.list {
            cell.titleLabel.text = photos[indexPath.item].title
            cell.photoImageView.kf.setImage(with: URL(string: photos[indexPath.item].thumbnailUrl))
            cell.url = photos[indexPath.item].url
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell {
            presenter?.open(url: cell.url!)
        }
    }
}
