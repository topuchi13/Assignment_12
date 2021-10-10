//
//  HomeTabTableViewController.swift
//  HomeTabTableViewController
//
//  Created by Nika Topuria on 09.10.21.
//

import UIKit

class SettingsTableVC: UITableViewController {
    
    var currentUser: String = ""
    var currentPassword: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = UserDefaults.standard.string(forKey: "CurrentUser")!
        currentPassword = UserDefaults.standard.string(forKey: currentUser)!
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTabCell", for: indexPath) as! SettingsTabCell
        
        cell.makeNewCellSettings(currentUser, currentPassword)
        return cell
    }
    
    

}

