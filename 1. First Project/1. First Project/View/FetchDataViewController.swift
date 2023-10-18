//
//  FetchDataViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 18/10/23.
//

import UIKit
import Alamofire

let userCell = "fetchDataCell"
let url = "https://dummy.restapiexample.com/api/v1/employees"

class FetchDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [Users]()
    var userEmployees : [UserEmployee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(
            UINib(nibName: "FetchDataView", bundle: nil),
            forCellReuseIdentifier: userCell)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 500
        
        print(userEmployees)
        
        self.fetchData(url: url)
    }
    
    func fetchData(url: String){
        AF.request(url, method: .get).responseData { response in
            print(response.response?.statusCode)
            switch response.result{
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode(Users.self, from: response.data!)
                    print(jsonData.data)
                    let personData = jsonData.data
                    for data in personData {
                        self.userEmployees.append(UserEmployee(name: data.employee_name, age: String(data.employee_age), salary: String(data.employee_salary)))
                    }
                    print(data)
                } catch {
                    print(String(describing: error))
                }

            case .failure(let error):
                print(error.localizedDescription)

            }
            
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCell, for: indexPath) as! FetchDataView

        cell.setValue(nameValue: userEmployees[indexPath.row].name, ageValue: userEmployees[indexPath.row].age,  salaryValue: userEmployees[indexPath.row].salary)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmployees.count
    }


}
