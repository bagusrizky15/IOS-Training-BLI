//
//  TaskMvViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 19/10/23.
//

import UIKit

var taskCell = "taskViewCell"
class TaskMvViewController: UIViewController {
    
    var karyawanData : [KaryawanModel] = []
    var mKaryawanModel = KaryawanViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: UIButton) {
//        present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        mKaryawanModel.popUpAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(
            UINib(nibName: "TaskTableViewCell", bundle: nil),
            forCellReuseIdentifier: taskCell)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension TaskMvViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCell) as! TaskTableViewCell
        
        cell.setValue(
            idValue: Int(karyawanData[indexPath.row].id),
            nameValue: karyawanData[indexPath.row].name,
            salaryValue: Int(karyawanData[indexPath.row].salary)
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        karyawanData.count
    }
    
}
