//
//  FetchDataView.swift
//  1. First Project
//
//  Created by BBPDEV on 18/10/23.
//

import UIKit
import Alamofire

class FetchDataView: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var ageText: UILabel!
    @IBOutlet weak var salaryText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(nameValue: String, ageValue: String, salaryValue: String) {
        nameText.text = nameValue
        ageText.text = ageValue
        salaryText.text = salaryValue
    }
    
}
