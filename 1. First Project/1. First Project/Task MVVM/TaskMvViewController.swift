//
//  TaskMvViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 19/10/23.
//

import UIKit

var taskCell = "taskViewCell"

class TaskMvViewController: UIViewController {
    
    var mKaryawanModel = KaryawanViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Tambah Data", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "ID"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Salary"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            
            self.mKaryawanModel.createData(
                id: Int(alertController.textFields![0].text!)!,
                name: alertController.textFields![1].text!,
                salary: Int(alertController.textFields![2].text!)!
            )
            
            self.tableView.reloadData()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        // Present the alert controller
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(nibName: "TaskTableViewCell", bundle: nil),
            forCellReuseIdentifier: taskCell)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 55
        
        mKaryawanModel.fetch()
    }
}

extension TaskMvViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCell) as! TaskTableViewCell
        
        cell.setValue(
            idValue: mKaryawanModel.karyawanData[indexPath.row].id,
            nameValue: mKaryawanModel.karyawanData[indexPath.row].name,
            salaryValue: mKaryawanModel.karyawanData[indexPath.row].salary
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mKaryawanModel.karyawanData.count
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let dataK = mKaryawanModel.karyawanData[indexPath.row]
            
            let alert = UIAlertController(title: "Ubah atau Hapus", message: "", preferredStyle: UIAlertController.Style.alert)
            
            alert.addTextField { (textField) in
                textField.placeholder = "\(dataK.id)"
            }
            alert.addTextField { (textField) in
                textField.placeholder = "\(dataK.name)"
            }
            alert.addTextField { (textField) in
                textField.placeholder = "\(dataK.salary)"
            }
            
            let deleteAction = UIAlertAction(title: "Delete", style: .default){ delete in
                self.mKaryawanModel.delete(id: dataK.id)
                self.mKaryawanModel.fetch()
                self.tableView.reloadData()
            }
            let updateAction = UIAlertAction(title: "Update", style: .default) { action in
                
                self.mKaryawanModel.createData(
                    id: Int(alert.textFields![0].text!)!,
                    name: alert.textFields![1].text!,
                    salary: Int(alert.textFields![2].text!)!
                )
                
                self.mKaryawanModel.fetch()
                self.tableView.reloadData()
            }
            
            alert.addAction(deleteAction)
            alert.addAction(updateAction)
            
            self.present(alert, animated: true)
            
        }
    
}
