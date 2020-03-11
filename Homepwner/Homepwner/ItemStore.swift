//
//  ItemStore.swift
//  Homepwner
//
//  Created by Riley, Kyle M on 2/19/20.
//  Copyright © 2020 Riley, Kyle M. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items").appendingPathExtension("plist")
    }()
    
    init() {
        if let data = try? Data(contentsOf: itemArchiveURL),
            let archivedItems = try? PropertyListDecoder().decode(Array<Item>.self, from: data) {
            allItems = archivedItems
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index =  allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }

    func saveChanges() {
        print("Saving items to: \(itemArchiveURL.path)")
        let archivedItems = try? PropertyListEncoder().encode(allItems)
        
        do {
            try archivedItems?.write(to: itemArchiveURL, options: .noFileProtection)
            print("Saved all ot the Items")
        } catch {
            print("Could not save any of the Items")
        }
    }
}
 
