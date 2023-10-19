//
//  CoreViewCell.swift
//  1. First Project
//
//  Created by BBPDEV on 19/10/23.
//

import UIKit

class CoreViewCell: UITableViewCell {

   
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var idText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(data: PersonModel) {
        idText.text = String(data.id)
        nameText.text = data.name
        
        print(data)
    }
    
}
