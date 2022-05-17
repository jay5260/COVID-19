//
//  TableViewController.swift
//  COVID-19
//
//  Created by R & W on 03/05/22.
//

import UIKit

class TableViewController: UITableViewController {

    var arrSideBar = ["Home","Contact Us"]
    var selectedIndex = -1
    @IBOutlet var sideBarTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSideBar.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrSideBar[indexPath.row]
        cell.textLabel?.textColor = selectedIndex == indexPath.row ? .red : .black
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        sideBarTableView.reloadData()
        switch indexPath.row {
        case 0,1:
            self.performSegue(withIdentifier: "Home", sender: nil)

        default:
            self.performSegue(withIdentifier: "Home", sender: nil)
        }
    }
    

 


}
