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
        import_data_course()
        import_data_uni()
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
    
    func import_data_course() {
        
        var urlpath_c  = NSBundle.mainBundle().pathForResource("classes", ofType: "csv")
        
        // IMPORT ALL COURSES
        if let csvURL:NSURL = NSURL.fileURLWithPath(urlpath_c!) {
            
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
                
                var saveErr : NSError?

                let del = UIApplication.sharedApplication().delegate as AppDelegate!
                
                let MOC = del.managedObjectContext
                
                var fetchRequest = NSFetchRequest(entityName: "ClassObject")
                
                let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [classObject]
                

                if results.count == 0
                {
                    for i in 0...rows - 1 {
                        
                        var courses = NSEntityDescription.insertNewObjectForEntityForName("ClassObject", inManagedObjectContext: MOC!) as classObject

                        // Get course area
                        courses.setValue(csv.rows[i]["area"]!, forKey: "igetc_area")

                        // Get course sub-area
                        courses.setValue(csv.rows[i]["sub_area"]!, forKey: "igetc_suba")

                        // Get course department
                        courses.setValue(csv.rows[i]["dept"]!, forKey: "department")

                        // Get course number
                        courses.setValue(csv.rows[i]["course_num"]!, forKey: "course_num")

                        // Get course title
                        let course_title = csv.rows[i]["title"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        courses.setValue(course_title, forKey: "course_tle")

                        // Get course description
                        let course_description = csv.rows[i]["description"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        courses.setValue(course_description, forKey: "course_des")
                    
                        // Get course units
                        courses.setValue(csv.rows[i]["units"]!, forKey: "course_unt")
                        
                        //Apply default course grade
                        courses.setValue(nil, forKey: "course_grd")
                        
                        //Apply default course taken
                        courses.setValue(0, forKey: "course_tkn")
                        
                    }
                    // Save
                    saveContext(MOC!)
                }
                else
                {
                    println("Results are not null")
                    println(results[0].course_des)
                }
                
                
            } // End of CSVBuild
            
        } // End of CSVPath for courses
        
    } //End import courses
    
    func import_data_uni() {
        
        var urlpath_u  = NSBundle.mainBundle().pathForResource("university", ofType: "csv")
        
        // IMPORT ALL UNIVERSITIES
        if let csvURL:NSURL = NSURL.fileURLWithPath(urlpath_u!) {
            
            var error: NSErrorPointer = nil
            
            if let csv = CSV(contentsOfURL: csvURL, error: error) {
                
                // Rows
                let rows = csv.rows.count
                
                // Start the collection process
                
                // Variables
                var saveErr : NSError?
                
                let del = UIApplication.sharedApplication().delegate as AppDelegate!
                
                let MOC = del.managedObjectContext
                
                var fetchRequest = NSFetchRequest(entityName: "UniObject")
                
                let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [UniObject]
                
                
                if results.count == 0
                {
                    for i in 0...rows - 1 {
                        
                        var university = NSEntityDescription.insertNewObjectForEntityForName("UniObject", inManagedObjectContext: MOC!) as UniObject
                        
                        // Get university name
                        university.setValue(csv.rows[i]["name"]!, forKey: "uni_name")
                        
                        // Get university acronym
                        university.setValue(csv.rows[i]["acronym"]!, forKey: "uni_acrn")
                        
                        // Get university founding year
                        university.setValue(csv.rows[i]["year_founded"]!, forKey: "uni_year")
                        
                        // Get university adminssion rate
                        university.setValue((csv.rows[i]["transfer_admission_rate"]! as NSString).doubleValue, forKey: "uni_admn")
                        
                        // Get university description
                        let university_description = csv.rows[i]["description"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        university.setValue(university_description, forKey: "uni_desc")
                        
                        // Get university rank
                        university.setValue(csv.rows[i]["us_rank"]!, forKey: "uni_rank")
                        
                        // Get university average transfer gpa
                        university.setValue((csv.rows[i]["average_gpa"]! as NSString).doubleValue, forKey: "uni_agpa")
                        
                        // Get university web address
                        university.setValue(csv.rows[i]["web_address"]!, forKey: "uni_urla")
                        
                        //Apply default course taken
                        university.setValue(csv.rows[i]["assist"]!, forKey: "uni_asst")
                    }
                    
                    // Save
                    saveContext(MOC!)
                    
                }
                else
                {
                    println("Results are not null")
                    println(results[0].uni_name)
                }
                
                
            } // End of CSVBuild
            
        } // End of CSVPath for universities
        
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

func saveContext (moc : NSManagedObjectContext) {
    var error: NSError? = nil
    if moc.hasChanges && !moc.save(&error) {
        NSLog("Unresolved error \(error), \(error!.userInfo)")
    }
}

func load_data(myMOC: NSManagedObjectContext) -> [classObject] {
    let fetchRequest = NSFetchRequest(entityName:"ClassObject")
    let fetchedResults = myMOC.executeFetchRequest(fetchRequest,error: nil) as [classObject]
    return fetchedResults
}
