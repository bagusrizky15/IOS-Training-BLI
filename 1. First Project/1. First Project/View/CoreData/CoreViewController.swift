//
//  CoreViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 19/10/23.
//

import UIKit
import CoreData

private var coreCell = "coreViewCell"

class CoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonClick(_ sender: UIButton) {
        alertButton()
    }
    
    var person : [PersonModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(
            UINib(nibName: "CoreViewCell", bundle: nil),
            forCellReuseIdentifier: coreCell)
        
        self.getData()
//        print(person)
//        self.dummyData()
    }
    
    func alertButton(){
        // Create an alert controller
        let alertController = UIAlertController(title: "Masukan ID dan Nama", message: nil, preferredStyle: .alert)
        
        // Add two text fields
        alertController.addTextField { (textField) in
            textField.placeholder = "ID"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        // Add OK and Cancel actions
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            // Retrieve the values entered in the text fields
            if let idTextField = alertController.textFields?.first,
               let nameTextField = alertController.textFields?.last,
               let id = idTextField.text,
               let name = nameTextField.text {
                
                print("Entered ID: \(id), Name: \(name)")
                self.createData(id: Int(id)!, name: name)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        // Present the alert controller
        present(alertController, animated: true, completion: nil)
    }
    
    func getData() -> [PersonModel]{
        var personModel: [PersonModel] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        do{
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            result.forEach{personss in
                personModel.append(PersonModel(
                    id: personss.value(forKey: "id") as! Int,
                    name: personss.value(forKey: "name") as! String)
                )
            }
        } catch let err {
            print(err)
        }
        return personModel
    }
    
    func createData(id: Int, name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        let insertData = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        insertData.setValue(id, forKey: "id")
        insertData.setValue(name, forKey: "name")
        
        do{
            try managedContext.save()
        } catch let err{
            print(err)
        }
        
    }
    
    func editPerson(_ id: Int, _ name: String){
        let alert = UIAlertController(title: "Edit", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { tf in
            tf.placeholder = "Id"
            tf.text = "\(id)"
        }
        
        alert.addTextField { tf in
            tf.placeholder = "Nama"
            tf.text = "\(name)"
        }
        
        alert.addAction(UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: { action in
            
            
            
        }))
        
    }
    
    func dummyData(){
        person.append(PersonModel(id: 1, name: "Bagus"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: coreCell, for: indexPath) as! CoreViewCell
        
        cell.setValue(data: person[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        editPerson
//    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if editingStyle == .delete {
//            delete(person[indexPath.row])
//
//            self.tableView.reloadData()
//        }
//    }
    
}
