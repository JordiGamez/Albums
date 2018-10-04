import Foundation

class PhotosMapper {
    
    /// Transform entity to object
    ///
    /// - Parameter entity: PhotosEntity
    /// - Returns: Photos
    func transform(_ entity: PhotosEntity) -> Photos {
        
        var photos = [Photo]()
        
        for photosEntity in entity.photos {
            let object = Photo(
                id: photosEntity.id,
                albumId: photosEntity.albumId,
                title: photosEntity.title,
                url: photosEntity.url,
                thumbnailUrl: photosEntity.thumbnailUrl)
            photos.append(object)
        }
        
        return Photos(list: photos)
    }
}
