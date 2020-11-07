//
//  ViewController.swift
//  LootLogger
//
//  Created by Noel Maldonado on 9/28/20.
//

import UIKit

class ItemsViewController: UITableViewController {

    var itemStore: ItemStore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allitems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create an instance of UITableViewCell with default appreance
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        // get a new or recyled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Set the Text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
        let item = itemStore.allitems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    

}

