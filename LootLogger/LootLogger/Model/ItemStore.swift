//
//  ItemStore.swift
//  LootLogger
//
//  Created by Noel Maldonado on 9/28/20.
//

import UIKit

class ItemStore {
    
    var allitems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allitems.append(newItem)
        
        return newItem
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
}
