//
//  CoreDataFavouriteWrapper.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation
import CoreData

class CoreDataFavouriteWrapper: CoreDataFavouriteWrapperProtocol {
    
    let manager: CoreDataManagerProtocol
    
    init(manager: CoreDataManagerProtocol) {
        self.manager = manager
    }
    
    func save(favourite: Favourite) {
        let entity = FavouriteEntity(context: manager.context)
        entity.id = Int64(favourite.id)
        entity.name = favourite.name
        entity.text = favourite.text
        entity.thumbnailPath = favourite.thumbnailPath
        entity.thumbnailExtension = favourite.thumbnailExtension
        manager.save(entity: entity)
    }
    
    func fetch(favourite: Favourite) -> Favourite? {
        let request: NSFetchRequest<FavouriteEntity> = FavouriteEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", String(favourite.id))
        
        do {
            guard let entity = try manager.context.fetch(request).first else {
                return nil
            }
            
            return Favourite(entity)
        } catch {
            print("Error fetching Core Data Entity \(error)")
        }
        
        return nil
    }
    
    func fetchAll() -> [Favourite] {
        let entities: [FavouriteEntity] = manager.fetchAll()
        return entities.compactMap{ Favourite($0) }
    }
    
    func delete(favourite: Favourite) {
        let request: NSFetchRequest<FavouriteEntity> = FavouriteEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", String(favourite.id))
        
        do {
            guard let result = try manager.context.fetch(request).first else {
                return
            }
            
            manager.delete(entity: result)
        } catch {
            print("Error fetching Core Data Entity \(error)")
        }
    }
}
