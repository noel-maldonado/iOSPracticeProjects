//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Noel Maldonado on 9/28/20.
//

import UIKit

class ItemsViewController: UITableViewController {

    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // figure out where that item is in the Array
        if let index = itemStore.allitems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            //insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            //change text of button to infrom user of state
            sender.setTitle("Edit", for: .normal)
            
            // turn off editing mode
            setEditing(false, animated: true)
        } else {
            //change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // enter editing mode
            setEditing(true, animated: false)
        }
    }
    
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

