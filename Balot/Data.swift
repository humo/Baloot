//
//  RealmData.swift
//  Balot
//
//  Created by 1 on 06/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//
import Foundation
import RealmSwift
var re : Results<RealmData>?
final class RealmData: Object {
    @objc dynamic var key = ""
    @objc dynamic var we = 0
    @objc dynamic var them = 0
    @objc dynamic var date = NSData()
    @objc dynamic var owner: Myparent?

   // let pa = LinkingObjects(fromType: Myparent.self, property: "ListBaloot")
   // var items = List<Myparent>()
    override static func primaryKey() -> String {
        return "key"
    }

    
    convenience  init(we: Int, them: Int, parent_id: String) {
        self.init()
        let Parent = Myparent()
        Parent.id = parent_id
        self.key = UUID().uuidString
        self.we = we
        self.them = them
        self.date = NSData()
        self.owner = Parent
        
    }
    
static func writeOnRealm(we: Int, them: Int, parent_id: String ){
    
        realm_QUEUE.sync {
        let data = RealmData(we: we, them: them, parent_id: parent_id)
         // let Parent = Myparent()
       //   Parent.list.append(data)
    
        do{
            let realm = try Realm()
            try realm.write {
                realm.add(data)
                try realm.commitWrite()
                
            }
        } catch{
            debugPrint("Error Can't Save")
        }
        }
    }
    static func readData(id: String) -> Results<RealmData> {
        let realm = try! Realm()
        re = realm.objects(RealmData.self).filter("owner.id == '\(id)'")
       
        return re!
        
    }
    static func back(id: String, object: Results<RealmData>) {
        
         let realm = try! Realm()
        let lastitem = realm.objects(Myparent.self).filter("id == '\(id)'")
        let Chield = realm.objects(RealmData.self).filter("owner.id == '\(id)'")
        
        do{
            try realm.write {
    
                if  lastitem.count > 1 && Chield.count > 1 {
               
                realm.delete(Chield.last!)
                realm.delete(lastitem.last!)
                
                }else if lastitem.count == 1 || Chield.count == 1 {
    
                realm.delete(Chield)
                realm.delete(lastitem)
                
                }else if lastitem.isEmpty {
                  print("not itmes")
                }
         
                
       
                }
     
            
        } catch{
            
        }
 
        do {
            try realm.write {
                
            }
        } catch{
            
        }
    }
}

final class Myparent: Object {
    @objc dynamic var id = ""
   let list = List<RealmData>()
 //   var ListBaloot = LinkingObjects(fromType: Myparent.self, property: "List")
//    convenience init(id: String, ListBaloot: List<RealmData>() {
//        self.init()
//        self.id = id
//        self.ListBaloot = List<RealmData>()
//    }
    
    
    
}




//
//

