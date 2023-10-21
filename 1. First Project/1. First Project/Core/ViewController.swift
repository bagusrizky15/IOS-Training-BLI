//
//  ViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 12/10/23.
//

import UIKit
import WatchConnectivity

var watchSession: WCSession?

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var textFill = ""
    
    let dict: [String : Any] = ["key": "Data Received"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !WCSession.isSupported() {
            watchSession = nil
            return
        }
        
        watchSession = WCSession.default
        watchSession?.delegate = self
        watchSession?.activate()
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
       
        print(Environment.productNameString)
    }
    
    
    @IBAction func watchClick(_ sender: UIButton) {
        do {
            try watchSession?.updateApplicationContext(dict)
            try watchSession?.sendMessage(dict, replyHandler: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func taskMvClick(_ sender: UIButton) {
        let taskMView = self.storyboard?.instantiateViewController(withIdentifier: "TaskMView") as! TaskMvViewController
        self.navigationController?.pushViewController(taskMView, animated: true)
    }
    
    @IBAction func mvvmButtonClick(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Warning", message: "Fiturnya belom selesai!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK Om!", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
        
//        let mvvmView = UIViewController(nibName: "mViewController", bundle: nil)
//        self.navigationController?.pushViewController(mvvmView, animated: true)
    }
    
    @IBAction func testButtonClick(_ sender: UIButton) {
//        let coreView = UIViewController(nibName: "CoreDataViewController", bundle: nil)
//        self.navigationController?.pushViewController(coreView, animated: true)
//        self.present(coreView, animated: true)
        
        let alert = UIAlertController(title: "Warning", message: "Fiturnya belom selesai!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK Om!", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
        
//        let coreView = self.storyboard?.instantiateViewController(withIdentifier: "CoreViewCell") as! CoreViewController
//        self.navigationController?.pushViewController(coreView, animated: true)
    }
    
    @IBAction func fetchDataClick(_ sender: UIButton) {
        let fetchView = self.storyboard?.instantiateViewController(withIdentifier: "FetchView") as! FetchDataViewController
        self.navigationController?.pushViewController(fetchView, animated: true)
    }
    
    @IBAction func buttonToTableClick(_ sender: UIButton) {
        
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

extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        watchSession?.activate()
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        watchSession?.activate()
    }
}

