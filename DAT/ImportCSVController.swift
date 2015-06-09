//
//  ImportCSVController.swift
//  DAT
//
//  Created by Adib Behjat on 6/6/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class ImportCSVController: UIViewController, NSCoding {
    @IBAction func run_import(sender: AnyObject) {
        import_data()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func import_data() {
        
        var urlpath = NSBundle.mainBundle().pathForResource("classes_short", ofType: "csv")
        
        if let csvURL:NSURL = NSURL.fileURLWithPath(urlpath!) {
            
            var error: NSErrorPointer = nil
            
            if let csv = CSV(contentsOfURL: csvURL, error: error) {
                
                // Rows
                let rows = csv.rows.count
                var headers = csv.headers  //=> Shows the headers
                
                // Columns
                let columns = csv.columns
                let names = csv.columns["title"]  //=> [lists all class titles in an array]
                
                var line = csv.rows[0]      //=> [title: Composition and Reading, sub_area: A, description: Introduction to university level reading and writing❤️ with an emphasis on analysis. Close examination of a variety of texts (personal❤️ popular❤️ literary❤️ professional❤️ academic) from culturally diverse traditions. Practice in common rhetorical strategies used in academic writing. Composition of clear❤️ well-organized❤️ and well-developed essays❤️ with varying purposes and differing audiences❤️ from personal to academic., area: 1, course_num: 1A, dept: EWRT, units: 5]
                
                /*
                WHY THE HEARTS?
                Comma-separated value files do not have a set standard, and the file gets breaken down wherever a comma exists. The ❤️ is merely used to replace in text commas from the .CSV file, and it will later be substituted to a comma after it is collected
                */
                
                // Start the collection process
                
                // Variables
                let myMOC = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext as NSManagedObjectContext!
                var saveErr : NSError?
                
                // Create object
                var courses = NSEntityDescription.insertNewObjectForEntityForName("ClassObject", inManagedObjectContext: myMOC) as classObject
                
                for i in 0...rows - 1 {
                
                    // Get course area
                    courses.igetc_area = csv.rows[i]["area"]
                    
                    // Get course sub-area
                    courses.igetc_suba = csv.rows[i]["sub_area"]!
                    
                    // Get course department
                    courses.department = csv.rows[i]["dept"]!
                    
                    // Get course number
                    courses.course_num = csv.rows[i]["course_num"]!
                    
                    // Get course title
                    let course_title = csv.rows[i]["title"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    courses.course_tle = course_title
                    
                    // Get course description
                    let course_description = csv.rows[i]["description"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    courses.course_des = course_description
                    
                    // Get course units
                    courses.course_unt = csv.rows[i]["units"]!
                    
                }
                
                if myMOC!.save(&saveErr) != true {
                    println("Insert to DB Error: \(saveErr?.localizedDescription)")
                    return
                }

                
            } // End of CSVBuild
            
        } // End of CSVPath
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
