//
//  CoreDataManagerProtocol.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    var context: NSManagedObjectContext { get }
    func save(entity: NSManagedObject)
    func fetch<T: NSManagedObject>() -> T?
    func fetchAll<T: NSManagedObject>() -> [T]
    func delete(entity: NSManagedObject)
}
