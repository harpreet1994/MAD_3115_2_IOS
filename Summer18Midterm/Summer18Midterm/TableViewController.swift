//
//  TableViewController.swift
//  Summer18Midterm
//
//  Created by Jigisha Patel on 2018-08-11.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var results : [(String, String)]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttemptCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.lblResult.text = results?[indexPath.row].0
        
        if results![indexPath.row].1 == "Correct" {
            cell.imgResult.image = UIImage(named: "Correct")
        }else{
            cell.imgResult.image = UIImage(named: "Wrong")
        }
        return cell
    }
}
