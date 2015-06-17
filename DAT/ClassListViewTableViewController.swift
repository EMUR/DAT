//
//  ClassListViewTableViewController.swift
//  DAT
//
//  Created by Jyoti Bhardwaj on 6/12/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class ClassListViewTableViewController: UITableViewController {


    var IGETCSections = ""
    var Subjects = [classObject]()
    var sectionNum = 0
    
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.translucent = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = Array(IGETCSections)[(IGETCSections as NSString).length - 1]
        let string = "\(str)"
        sectionNum = string.toInt()!
        // Retrieve University Data
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchRequest = NSFetchRequest(entityName: "ClassObject")
        let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [classObject]
        
        // Go through the results and append the logo names
        for i in 0...results.count - 1 {
            if results[i].igetc_area.toInt() == sectionNum
            {
                Subjects.append(results[i])
            }
        }
        
//        // Sort the Array
//        Uni_Arrays.sort {
//            return $0 < $1
//        }
//        
//        // Testing purposes
//        println(Uni_Arrays)

        
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return Subjects.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClassCell", forIndexPath: indexPath) as ClassListTableViewCell

        cell.courseDept.adjustsFontSizeToFitWidth = true
        cell.courseLabel.text = Subjects[indexPath.row].course_tle
        cell.courseNum.text = "Course Number : \(Subjects[indexPath.row].course_num)"
        cell.courseDept.text = "Department: \(Subjects[indexPath.row].department)"

        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
