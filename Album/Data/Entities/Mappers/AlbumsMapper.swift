import Foundation

class AlbumsMapper {
    
    /// Transform entity to object
    ///
    /// - Parameter entity: AlbumsEntity
    /// - Returns: Albums
    func transform(_ entity: AlbumsEntity) -> Albums {
        
        var albums = [Album]()
        
        for albumEntity in entity.albums {
            let object = Album(id: albumEntity.id, name: albumEntity.title)
            albums.append(object)
        }
        
        return Albums(list: albums)
    }
}
