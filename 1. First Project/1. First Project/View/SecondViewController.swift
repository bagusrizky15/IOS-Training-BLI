//
//  SecondViewController.swift
//  1. First Project
//
//  Created by BBPDEV on 13/10/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameText: UILabel!
    
    var myName: String = "Nama"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myName)
        nameText.text = "Hello \(myName)"
    }

}
