//
//  ViewController.swift
//  Balot
//
//  Created by 1 on 05/01/1440 AH.
//  Copyright © 1440 1. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TheirText: UITextField!
    
    @IBOutlet weak var ourResult: UILabel!
    @IBOutlet weak var theirResult: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var We: UITextField!
    @IBOutlet weak var Them: UITextField!
    var Baloot = RealmData()
    
    let realm = try! Realm()
    var id : String?
    var b : Results<RealmData>!
    var ThemTotal = [Int]()
    var OurTotal = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        We.keyboardType = .asciiCapableNumberPad
        Them.keyboardType = .asciiCapableNumberPad
        id = UUID().uuidString
        tableView.delegate = self
        tableView.dataSource = self
       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        print(realm.configuration.fileURL)
        view.addGestureRecognizer(tap)
        b = RealmData.readData(id: id!)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        id = ""
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
    }
    
    @IBAction func Dissmiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func check(){
        ThemTotal.removeAll()
        OurTotal.removeAll()
            for i in b {
            ThemTotal.append(i.them)
            OurTotal.append(i.we)
            
            }
        print(ThemTotal.reduce(0, +))
        print(OurTotal.reduce(0, +))
        let ThemT = ThemTotal.reduce(0, +)
        let OurT = OurTotal.reduce(0, +)
        if OurT > 0 {
        ourResult.text = String(OurT)
        }else{
        ourResult.text = "0"
        }
        if ThemT > 0 {
        theirResult.text = String(ThemT)
        }else{
        theirResult.text = "0"
        }
        if ThemT > 300 || OurT > 300 {
        let alert = UIAlertController(title: "", message: "نتعذر منك سنقوم بإنهاء هذه اللعبة", preferredStyle: .alert)
            let action = UIAlertAction(title: "إعادة", style: .default) { (UIAlertAction) in
                self.replay()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        if ThemT > 152 && ThemT > OurT {
            
            let alertController = UIAlertController(title: "", message: "هاردلك لقد خسرت", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "التالي", style: .default) { (action:UIAlertAction) in
                let alert = UIAlertController(title: "", message: "هل تريد أن تلعب لعبة أخرى", preferredStyle: .alert)
                let yes = UIAlertAction(title: "نعم", style: .default) { (action:UIAlertAction) in
                  self.replay()
                }
                
                let No = UIAlertAction(title: "لا", style: .cancel) { (action:UIAlertAction) in
                    let viewController = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(viewController!, animated: true, completion: nil)
                }
                
                alert.addAction(yes)
                alert.addAction(No)
                self.present(alert, animated: true, completion: nil)
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        
            
            
        }else if OurT > 152 && OurT > ThemT {
            
            
            let alertController = UIAlertController(title: "", message: "مبروك لقد فزت", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "التالي", style: .default) { (action:UIAlertAction) in
                let alert = UIAlertController(title: "", message: "هل تريد أن تلعب لعبة أخرى", preferredStyle: .alert)
                let yes = UIAlertAction(title: "نعم", style: .default) { (action:UIAlertAction) in
                    self.replay()
                }
                let No = UIAlertAction(title: "لا", style: .cancel) { (action:UIAlertAction) in
                    let viewController = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(viewController!, animated: true, completion: nil)

                }
                alert.addAction(yes)
                alert.addAction(No)
                self.present(alert, animated: true, completion: nil)
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            
            
            
        }else{
        }
        
        }
    
    func replay(){
        self.id = UUID().uuidString
        self.b = nil
        self.b =  RealmData.readData(id: self.id!)
        self.tableView.reloadData()
        ourResult.text = "0"
        We.text = ""
        theirResult.text = "0"
        Them.text = ""
    }
    @IBAction func Back(_ sender: UIButton) {
        print("Back button clicked")
        sender.isHidden = false
        if id?.isEmpty == false {
        RealmData.back(id: id!, object: b)
        check()
       tableView.reloadData()
        }
    }
    
    @IBAction func Add(_ sender: Any) {
        if We.text?.isEmpty == false && Them.text?.isEmpty == false &&
            We.text?.isInt == true && Them.text?.isInt == true && Int(We.text!)! < 153 && Int(Them.text!)! < 153 && id != nil
        {
          
           view.endEditing(true)
           
            RealmData.writeOnRealm(we: Int(We.text!)!, them: Int(Them.text!)!, parent_id: id!)
           
            b =  RealmData.readData(id: id!)
            check()
            We.text = ""
            Them.text = ""
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if b != nil {
        return b.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Bloot", for: indexPath) as! BlootTableViewCell
        Cell.OurLable.textColor = .white
        Cell.ThemLabel.textColor = .white
        Cell.config(Them: b[indexPath.row].them, Our: b[indexPath.row].we)
       
        if (indexPath.row + 1)  == (b.count) {
            Cell.backButton.isHidden = false
        }else {
         Cell.backButton.isHidden = true

        }
        
        return Cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let cell:UITableViewCell? = tableView.cellForRow(at: indexPath)
        print(b[indexPath.row].key)
    }
    
}
extension String {
    var isInt: Bool {
        return Int(self) != nil
        
        }
    
    
}


extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x:x,y:y,width:width,height:height)
}
}
