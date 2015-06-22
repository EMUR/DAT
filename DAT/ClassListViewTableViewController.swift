//
//  ClassListViewTableViewController.swift
//  DAT
//
//  Created by Jyoti Bhardwaj on 6/12/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData
import SWTableViewCell

class ClassListViewTableViewController: UITableViewController, SWTableViewCellDelegate {


    var IGETCSections = ""
    var Subjects = [classObject]()
    var sectionNum = 0
    
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.translucent = false
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = IGETCSections
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = Array(IGETCSections)[(IGETCSections as NSString).length - 1]
        let string = "\(str)"
        sectionNum = string.toInt()!
        // Retrieve course Data
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchRequest = NSFetchRequest(entityName: "ClassObject")
        let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [classObject]
        
        // Go through the results and collect the subjects
        for i in 0...results.count - 1 {
            if results[i].igetc_area.toInt() == sectionNum
            {
                Subjects.append(results[i])
            }
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
        cell.rightUtilityButtons = self.right()
        cell.delegate = self
        return cell
    }
    
    
    func swipeableTableViewCell(cell: SWTableViewCell!, didTriggerRightUtilityButtonWithIndex index: Int) {
        if (index == 0)
        {
            let actionSheetController: UIAlertController = UIAlertController(title: "Add", message: "What was your grade?", preferredStyle: .Alert)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
                //Do some stuff
            }
            actionSheetController.addAction(cancelAction)
            //Create and an option action
            let nextAction: UIAlertAction = UIAlertAction(title: "Add", style: .Default) { action -> Void in
                //Do some other stuff
            }
            actionSheetController.addAction(nextAction)
            //Add a text field
            actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
                //TextField configuration
                textField.textColor = UIColor.blueColor()
            }
            
            //Present the AlertController
            self.presentViewController(actionSheetController, animated: true, completion: nil)
            
            cell
        }
    }
    
    func right()->NSArray
    {
        var rightUtilityButtons = NSMutableArray();
        rightUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: CGFloat(121.0/255.0), green: CGFloat(186.0/255.0), blue: CGFloat(116.0/255.0), alpha: 1.0), title: "Add Class")
        
        return rightUtilityButtons
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        

        performSegueWithIdentifier("click", sender: indexPath.row)
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        if (segue.identifier == "click")
        {
            let class_detail = segue.destinationViewController as ClassDetails
            class_detail.classInfo = Subjects[sender as Int]
            
        }// End of segue identifier
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
