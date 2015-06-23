//
//  ChooseUniTableViewController.swift
//  DAT
//
//  Created by Adib Behjat on 6/21/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

struct Colleges
{
    static var name:UniObject! = nil
}

class ChooseUniTableViewController: UITableViewController {
    
    // Initialize variables
    var universities : [UniObject] = []
    var checkMark : [Bool] = []
    var selectedIndexs: NSMutableArray! = []
    
    @IBOutlet weak var next: UIButton!
    func retrieveDBResults() {
        // Retrieve University Data
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchRequest = NSFetchRequest(entityName: "UniObject")
        universities = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [UniObject]
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        next.enabled = false
        next.setTitleColor(UIColor(white: 0.5, alpha: 1.0), forState: UIControlState.Disabled)
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        retrieveDBResults()
        
        for (var i = 0; i < universities.count ; i++)
        {
            checkMark.append(false)
        }
        
    }

    @IBAction func GoNext(sender: AnyObject) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("SetUpViewController") as SetUpViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return universities.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellObject : UniObject
        let cellIdentifier = "UniCell"
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as UniTableViewCell
        cell.contentView.alpha = 0.3
        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)

        // Configure the cell...
        
        cellObject = self.universities[indexPath.row]
        
        if self.selectedIndexs.containsObject(indexPath) {
            cell.contentView.alpha = 1.0

        } else {
            cell.contentView.alpha = 0.3
        }
        cell.uni_name?.text = cellObject.uni_name
        cell.uni_logo?.image = UIImage(named: cellObject.uni_acrn + "L")
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if self.selectedIndexs.containsObject(indexPath) {
            self.selectedIndexs.removeObject(indexPath)
            next.enabled = false
            
        } else {
            if self.selectedIndexs.count == 0 {
                self.selectedIndexs.addObject(indexPath)
                next.enabled = true
                Colleges.name = self.universities[indexPath.row]
            } else {
                return
            }
        }
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "go_to_app")
        {
            // Do some database shit
            let destinationNavigationController = segue.destinationViewController as UINavigationController
            let targetController = destinationNavigationController.topViewController
        }
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


}
