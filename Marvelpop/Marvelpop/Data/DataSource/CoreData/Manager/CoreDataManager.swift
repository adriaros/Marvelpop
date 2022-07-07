//
//  CoreDataManager.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation
import CoreData

enum CoreDatabasePersistenceType {
    case persistent
    case inMemory
}

class CoreDataManager: CoreDataManagerProtocol {
    
    let container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    init(_ type: CoreDatabasePersistenceType = .persistent) {
        container = NSPersistentContainer(name: "MarvelpopCoreData")
        
        if type == .inMemory {
          let description = NSPersistentStoreDescription()
          description.url = URL(fileURLWithPath: "/dev/null")
          container.persistentStoreDescriptions = [description]
        }
        
        container.loadPersistentStores { _, _ in }
    }
    
    func save(entity: NSManagedObject) {
        do {
            try context.save()
        } catch {
          print("Error saving Core Data Entity — \(error)")
        }
    }
    
    func fetch<T: NSManagedObject>() -> T? {
        let request: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        
        do {
            let result = try container.viewContext.fetch(request).first
            return result
        } catch {
            print("Error fetching Core Data Entity \(error)")
        }
        
        return nil
    }
    
    func fetchAll<T: NSManagedObject>() -> [T] {
        let request: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Error fetching Core Data Entities \(error)")
        }
        
        return []
    }
    
    func delete(entity: NSManagedObject) {
        do {
            context.delete(entity)
            try context.save()
        } catch {
            print("Error deleting Core Data Entity \(error)")
        }
    }
}
