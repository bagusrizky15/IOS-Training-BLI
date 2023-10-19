//
//  KaryawanViewModel.swift
//  1. First Project
//
//  Created by BBPDEV on 19/10/23.
//

import Foundation
import UIKit

var controller : UIViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController

class KaryawanViewModel {
    func popUpAlert(){
        let alert = UIAlertController(title: "Tambahkan Data", message: nil, preferredStyle: .alert)
     
        alert.addTextField { (textField) in
            textField.text = "ID"
        }
        alert.addTextField { (textField) in
            textField.text = "Name"
        }
        alert.addTextField { (textField) in
            textField.text = "Salary"
        }
        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
//
//            if let idTextField = alert.textFields,
//               let nameTextField = alert.textFields,
//               let salaryTextField = alert.textFields,
//               let id = idTextField.text,
//               let name = nameTextField.text,
//               let salary = salaryTextField.text{
//
//                print("Entered ID: \(id), Name: \(name), Salary: \(salary)")
//            }
//        }
//
//        alert.addAction(cancelAction)
//        alert.addAction(saveAction)
        
        // Present the alert controller
        controller.present(alert, animated: true)
    }
}
