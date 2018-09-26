import UIKit
import RealmSwift
class DBManager {
    private var   database:Realm
    static let   sharedInstance = DBManager()
    private init() {
        database = try! Realm()
    }
    func getDataFromDB() ->   Results<Object> {
        let results: Results<Object> =   database.objects(Object.self)
        return results
    }
    func addData(object: Object)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    func deleteFromDb(object: Object)   {
        try!   database.write {
            database.delete(object)
        }
    }
}
