import UIKit
import CoreData
import RxSwift

/// Responsible for accessing, saving and deleting the local data
class LocalDataSource {
    
    // MARK: - Constants
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let entityName = "AlbumCoreData"
    let fieldId = "id"
    let fieldUserId = "userId"
    let fieldName = "title"
    
    // MARK: - Private methods
    
    /// Check if there is local data
    ///
    /// - Returns: True if it exists, false otherwise
    fileprivate func checkIfLocalDataIsEmpty() -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for _ in result as! [NSManagedObject] {
                return false
            }
        } catch {
            print("Fail")
        }
        
        return true
    }
    
    /// Delete all the local data
    fileprivate func deleteLocalData() {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
        } catch {
            print("Fail")
        }
        
        do {
            try context.save()
        } catch {
            print("Fail")
        }
    }
}

// MARK: - LocalDataSourceProtocol protocol conformance

extension LocalDataSource: LocalDataSourceProtocol {
    
    /// Get the albums list
    ///
    /// - Returns: Albums Observable
    func getAlbums() -> Observable<Albums> {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        
        return Observable<Albums>.create{ observer in
                
            var albumsArray = [Album]()
            
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    let object = Album(
                        id: data.value(forKey: self.fieldId) as! Int,
                        userId: data.value(forKey: self.fieldUserId) as! Int,
                        name: data.value(forKey: self.fieldName) as! String)
                    albumsArray.append(object)
                }
            } catch {
                print("Fail")
            }
            
            observer.on(.next(Albums(list: albumsArray)))
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    /// Save the albums list
    ///
    /// - Parameter albums: Albums list
    func saveAlbums(albums: Albums) {
        if !checkIfLocalDataIsEmpty() {
            deleteLocalData()
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        
        for album in albums.list {
            let object = NSManagedObject(entity: entity!, insertInto: context)
            object.setValue(album.id, forKey: fieldId)
            object.setValue(album.userId, forKey: fieldUserId)
            object.setValue(album.name, forKey: fieldName)
        }
        
        do {
            try context.save()
        } catch {
            print("Fail")
        }
    }
}
