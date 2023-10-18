//
//  TableViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 13/10/23.
//

import UIKit

let profileCell = "tableViewCell"

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataProfile = Profile(name: "Bagus", job: "iOS Developer", age: 21, bio: "Hello")
    
    let profileTypeOrder = [
        ProfileType.name,
        ProfileType.job,
        ProfileType.age,
        ProfileType.bio
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(
                nibName: "ProfileView", bundle: nil
            ),
            forCellReuseIdentifier: profileCell
        )
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 216
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCell, for: indexPath) as! ProfileView
        
        let cellData: [(ProfileType, String)] = [
            (profileTypeOrder[0], dataProfile.name),
            (profileTypeOrder[1], dataProfile.job),
            (profileTypeOrder[2], String(dataProfile.age)),
            (profileTypeOrder[3], dataProfile.bio),
        ]
        
        cell.setValue(type: cellData[indexPath.row].0, value: cellData[indexPath.row].1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}

