//
//  ChancesViewTableViewController.swift
//  DAT
//
//  Created by E on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class ChancesViewTableViewController: UITableViewController {

    override func viewWillLayoutSubviews() {
        self.tableView.bounds.size.width = UIScreen.mainScreen().bounds.width
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    

    
     /****** Chances Calculator ******/
    func calculate_gpa_chance(usr_gpa: Double, uni_gpa: Double) -> String {
        
        // Fixed Variable - STD DEV of GPAs
        var std_dev_uni = 0.17
        
        // Variables needed
        var avg_uni_gpa = uni_gpa
        var avg_usr_gpa = usr_gpa
        
        // Normal Distribution Calculator
        var percentile = (avg_usr_gpa - avg_uni_gpa) / std_dev_uni
        
        // Utilize Z value calculations to provide info
        
        if percentile >= 0 { // At least above 50% percentile
            
            if percentile > 0.675 { // If more than the 75% percentile
                
                return "High"
                
            } else { // If between 50% - 75% percentile
                
                return "Above Average"
            }
            
        } else if percentile < 0 { // At least above 50% percentile
            
            if abs(percentile) > 0.675 { // If less than 25% percentile
                
                return "Low"
                
            } else { // If less than 25% - 50% percentile
                
                return "Average"
            }
        }
        /*** End of Chances Caculator ***/
        
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve University Data
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchRequest = NSFetchRequest(entityName: "UniObject")
        let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [UniObject]
        
        var usr_gpa = 3.75
        
        for uni in results {
            var outcome = calculate_gpa_chance(usr_gpa, uni_gpa: Double(uni.uni_agpa))
            println("At \(uni.uni_name), your probability to get in is \(outcome)")
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
