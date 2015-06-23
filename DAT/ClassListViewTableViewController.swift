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

class ClassListViewTableViewController: UITableViewController, SWTableViewCellDelegate, NSCoding {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

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
        var class_grade_i : String = ""
        
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
                if let field = actionSheetController.textFields![0] as? UITextField {
                    // store the data
                    class_grade_i = field.text
//                    var theCourse = self.Subjects[self.tableView.indexPathForCell(cell!)!.row]
//                    var class_area_i = theCourse.igetc_area
//                    var class_dept_i = theCourse.department
//                    var class_number_i = theCourse.course_num
//                    var class_units_i = (theCourse.course_unt as NSString).doubleValue
//                    
//                    switch class_grade_i {
//                    case "a":
//                        class_grade_i = "A"
//                    case "A+":
//                        class_grade_i = "A"
//                    case "A-":
//                        class_grade_i = "Am"
//                    case "a-":
//                        class_grade_i = "Am"
//                    case "B+":
//                        class_grade_i = "Bp"
//                    case "b+":
//                        class_grade_i = "Bp"
//                    case "b":
//                        class_grade_i = "B"
//                    case "B-":
//                        class_grade_i = "Bm"
//                    case "b-":
//                        class_grade_i = "Bm"
//                    case "C+":
//                        class_grade_i = "Cp"
//                    case "c+":
//                        class_grade_i = "Cp"
//                    case "c":
//                        class_grade_i = "C"
//                    case "D+":
//                        class_grade_i = "Dp"
//                    case "d+":
//                        class_grade_i = "Dp"
//                    case "d":
//                        class_grade_i = "D"
//                    case "D-":
//                        class_grade_i = "Dm"
//                    case "d-":
//                        class_grade_i = "Dm"
//                    case "f":
//                        class_grade_i = "F"
//                    default:
//                        class_grade_i = "F"
//                    } // End of Switch
//                    
//                    var saveErr : NSError?
//                    let del = UIApplication.sharedApplication().delegate as AppDelegate!
//                    let MOC = del.managedObjectContext
//                    var courseTaken = NSEntityDescription.insertNewObjectForEntityForName("CourseTaken", inManagedObjectContext: MOC!) as CourseTaken
//                    
//                    // Add the courses
//                    courseTaken.setValue(class_area_i, forKey: "class_area")
//                    courseTaken.setValue(class_grade_i, forKey: "class_grade")
//                    courseTaken.setValue("1", forKey: "class_quarter")
//                    courseTaken.setValue(class_dept_i, forKey: "class_dept")
//                    courseTaken.setValue(class_number_i, forKey: "class_number")
//                    courseTaken.setValue(class_units_i, forKey: "class_units")
//                    
//                    if MOC!.save(&saveErr) {
//                        println("Could not save \(saveErr), \(saveErr?.description)")
//                    } else {
//                        println("Successfully added class!")
//                    } // End of Save
                    
//                    var add_course_func = addmyCourse()
//                    add_course_func.addCourse(class_area_i, class_grade: class_grade_i, class_quarter: "1", class_dept: class_dept_i, class_number: class_number_i, class_units: class_units_i)
                } else {
                    println("Failed to collect")
                }
            }
            actionSheetController.addAction(nextAction)
            
            //Add a text field
            actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
                //TextField configuration
                textField.textColor = UIColor.blueColor()
            }
            
            //Present the AlertController
            self.presentViewController(actionSheetController, animated: true, completion: nil)
            
        } // End of If
        
    } // End of func
    
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
