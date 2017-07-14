//
//  ItemTableViewController.swift
//  SoloLearnApp
//
//  Created by Cristian Acuña on 11-07-17.
//  Copyright © 2017 Nihilism Incorporated. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {

	var items = [Item?]()

	func loadSampleItems() {
		items.append(contentsOf:
		[
			Item(name: "item1"),
			Item(name: "item2"),
			Item(name: "item3")
		])
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

		// Load saved items
		if let savedItems = loadItems() {
			items.append(contentsOf: savedItems)
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as!
          ItemTableViewCell

        let item = items[indexPath.row]

        cell.nameLabel.text = item?.name

        return cell
    }
	
	@IBAction func unwindToList(sender: UIStoryboardSegue) {
		let srcViewCon = sender.source as? ViewController
		let item = srcViewCon?.item
		
		if (srcViewCon != nil && item?.name != "") {
			// Add a new item
			let newIndexPath = IndexPath(row: items.count, section: 0)
			items.append(item!)
			tableView.insertRows(at: [newIndexPath], with: .bottom)
			saveItems()
		}
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
			items.remove(at: indexPath.row)
			saveItems()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		if segue.identifier == "ShowDetails" {
			let detailVC = segue.destination as! ViewController
			
			guard let selectedCell = sender as! ItemTableViewCell? else {
				return
			}
			let indexPath = tableView.indexPath(for: selectedCell)
			let selectedItem = items[(indexPath?.row)!]
			detailVC.item = selectedItem
		} else if segue.identifier == "AddItem" {
			
		}
    }
	
	func saveItems() {
		guard NSKeyedArchiver.archiveRootObject(items, toFile: Item.archiveURL.path) else {
			print("Failed to save items...")
			return
		}
	}
	
	func loadItems() -> [Item?]? {
		return NSKeyedUnarchiver.unarchiveObject(withFile: Item.archiveURL.path) as? [Item]
	}
}
