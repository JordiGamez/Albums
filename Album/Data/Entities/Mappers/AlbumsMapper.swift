import Foundation

class AlbumsMapper {
    
    /// Transform entity to object
    ///
    /// - Parameter entity: AlbumsEntity
    /// - Returns: Albums
    func transform(_ entity: AlbumsEntity) -> Albums {
        
        var albums = [Album]()
        
        for albumEntity in entity.albums {
            let object = Album(name: albumEntity.name)
            albums.append(object)
        }
        
        return Albums(albums: albums)
    }
}
