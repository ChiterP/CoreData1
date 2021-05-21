//
//  StorageManager.swift
//  CoreData1
//
//  Created by Алексей Сергейцев on 5/15/21.
//

import CoreData

class StorageManager {

    static let shared = StorageManager()
    
    
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = persistentContainer.viewContext
    }
    
    // MARK: - Public Methods
    func fetchData(completion: (Result<[Workout], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        
        do {
            let workouts = try viewContext.fetch(fetchRequest)
            completion(.success(workouts))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    
    
    // Save data
    func save(_ workoutName: String, completion: (Workout) -> Void) {
        let workout = Workout(context: viewContext)
        workout.name = workoutName
        
        completion(workout)
        saveContext()
    }
    
    
    func delete(_ workout: Workout) {
        viewContext.delete(workout)
        saveContext()
    }
    
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
   
}
