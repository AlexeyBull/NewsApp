//
//  CoreDataStack.swift
//  NewsApp
//
//  Created by Admin on 31.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import CoreData

final class CoreDataStack {

    static let shared = CoreDataStack()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (description, error) in
            print(description)
            if let error = error {
                fatalError("Unable to load persistent store: \(error)")
            }
        })
        return container
    }()

    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

}

