//
//  SettingsTableViewCell.swift
//  SettingsTableViewCell
//
//  Created by Nika Topuria on 09.10.21.
//

import UIKit

class SettingsTabCell: UITableViewCell {

    
    @IBOutlet var usernameField: UILabel!
    
    @IBOutlet var passwordField: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func makeNewCellSettings (_ username: String, _ password: String) {
        usernameField.text = username
        passwordField.text = password
    }
    
    
}
