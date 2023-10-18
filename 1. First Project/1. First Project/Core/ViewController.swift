//
//  ViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 12/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var textFill = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
    }

    @IBAction func buttonToTableClick(_ sender: Any) {
        
//        performSegue(withIdentifier: "toTableView", sender: nil)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableView") as! TableViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        //navigation with segue
        if textField.text == ""{
            let alert = UIAlertController(title: "Warning", message: "Please fill your name", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
            
        } else {
            self.textFill = textField.text!
    //        performSegue(withIdentifier: "toSecondVC", sender: self)
            
            //navigation with program
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondView") as! SecondViewController
            
            //passing data use navigation controller
            vc.myName = textFill
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //passing data with segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toSecondVC" {
//            let destinationVC = segue.destination as? SecondViewController
//            destinationVC?.myName = textFill
//        }
//    }
    
}

