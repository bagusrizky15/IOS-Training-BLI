//
//  TaskTableViewCell.swift
//  1. First Project
//
//  Created by BBPDEV on 19/10/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var salaryText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(idValue: Int, nameValue: String, salaryValue: Int) {
        idText.text = String(idValue)
        nameText.text = nameValue
        salaryText.text = String(salaryValue)
        
        print(idValue)
        print(nameValue)
        print(salaryValue)
    }
    
}
