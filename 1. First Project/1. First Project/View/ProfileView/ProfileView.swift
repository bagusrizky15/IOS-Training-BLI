//
//  ProfileView.swift
//  1. First Project
//
//  Created by BBPDEV on 13/10/23.
//

import UIKit

class ProfileView: UITableViewCell {
    
    @IBOutlet weak var descText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(type: ProfileType, value: String) {
        titleText.text = type.rawValue
        descText.text = value
        
        if type == ProfileType.bio {
            descText.numberOfLines = 0
        } else {
            descText.numberOfLines = 1
        }
    }
    
}
