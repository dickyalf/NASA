import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "NasaModel")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }

    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func addPostHistory(response: HistoryModel) {
        let context = container.viewContext
        let history = History(context: context)
        history.id = UUID()
        history.startingPoint = response.startingPoint
        history.destination = response.destination
        history.budget = Int32(response.budget)
        history.stay = Int32(response.stay)
        history.peopleCount = Int32(response.peopleCount)
        history.content = response.content
        saveContext()
    }

    func fetchPostHistory() -> [History] {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<History> = History.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch post history: \(error)")
        }
    }
}
