//
//  History.swift
//  Balot
//
//  Created by 1 on 18/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//

import UIKit

class History: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var TableView: UITableView!
    var id : String?
    var result: [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.rowHeight = 80
        TableView.delegate = self
        TableView.dataSource = self
       // TableView.rowHeight = 30
        RealmData.Results { (results) in
            self.result = results
        }
    }
    
    @IBAction func dissmiss(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = TableView.dequeueReusableCell(withIdentifier: "Result", for: indexPath) as! HistoryCellTableViewCell
        if result[indexPath.row].we > result[indexPath.row].They {
            Cell.We.textColor = #colorLiteral(red: 0.04870834635, green: 0.5416798858, blue: 0.00658332038, alpha: 1)
        }else if result[indexPath.row].we < result[indexPath.row].They {
            Cell.We.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        if result[indexPath.row].we < result[indexPath.row].They {
            Cell.They.textColor = #colorLiteral(red: 0.04870834635, green: 0.5416798858, blue: 0.00658332038, alpha: 1)
        }else if result[indexPath.row].we > result[indexPath.row].They {
            Cell.They.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
       
        Cell.config(Them: result[indexPath.row].They, Our: result[indexPath.row].we)
        return Cell
    }
    
}
