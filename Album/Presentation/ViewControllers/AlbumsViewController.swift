import UIKit

class AlbumsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var customView: AlbumsView!
    
    // MARK: - Constants
    
    let customCellIdentifier = "AlbumTableViewCellIdentifier"
    
    // MARK: - Variables
    
    var presenter: AlbumsPresenterProtocol?
    var albums: Albums?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.albumsTableView.dataSource = self
        customView.albumsTableView.delegate = self
        
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
    
    /// Display the list of albums
    ///
    /// - Parameter list: Albums list
    func display(list: Albums) {
        albums = list
        customView.reloadTable()
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource protocol conformance

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let albums = albums {
            return albums.list.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as! AlbumTableViewCell
        
        cell.titleLabel.text = albums?.list[indexPath.row].name
        
        return cell
    }
}
