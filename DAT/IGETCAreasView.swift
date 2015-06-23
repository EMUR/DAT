//
//  IGETCAreasView.swift
//  DAT
//
//  Created by E on 6/3/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class IGETCAreasView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mainTable: UITableView!

    var IGETCSections = [String]()

    override func viewWillLayoutSubviews() {
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Areas"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IGETCSections = ["Area 1","Area 2","Area 3","Area 4","Area 5","Area 6"]
        
        self.mainTable.delegate = self
        self.mainTable.dataSource = self
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


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return IGETCSections.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AreaCell", forIndexPath: indexPath) as AreaCustomCell
        
        cell.bounds.size.width = self.mainTable.bounds.width

        cell.AreaText.text = self.IGETCSections[indexPath.row]
        var area_zone = self.IGETCSections[indexPath.row]
        switch area_zone {
            case "Area 1":
                cell.ClassesCount.text = "0/10"
            case "Area 2":
                cell.ClassesCount.text = "0/4"
            case "Area 3":
                cell.ClassesCount.text = "0/12"
            case "Area 4":
                cell.ClassesCount.text = "0/12"
            case "Area 5":
                cell.ClassesCount.text = "0/9"
            case "Area 6":
                cell.ClassesCount.text = "0/10"
            default:
                cell.ClassesCount.text = "0/10"
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("Details", sender: self)
        self.mainTable.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Details") {
        
            var segueObject : classObject
            var indPath : NSIndexPath

            let classViewController = segue.destinationViewController as ClassListViewTableViewController
            indPath = self.mainTable.indexPathForSelectedRow()!
            classViewController.IGETCSections = self.IGETCSections[indPath.row]
            
         //classViewController.courseLabel = segueObject.course_tle
            
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
