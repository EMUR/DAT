//
//  GPA_Calculator.swift
//  DAT
//
//  Created by Adib Behjat on 6/3/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class GPA_Calculator: UIViewController, NSCoding {
    
    @IBOutlet var gpa_value: UILabel!

    
    var grades = ["A","B","Bp","A","Ap","Ap","Bp"]
    var units  = [5,4,3,3,5,2,5]
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateGPA(gpa: Double) {
        //Retrieve Database information from the user
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchUserData = NSFetchRequest(entityName: "UserObject")
        var user_data = MOC?.executeFetchRequest(fetchUserData, error: &saveErr) as [UserObject]
        
        if user_data.count == 0 {
            println("Data is fresh")
            var user_profile = NSEntityDescription.insertNewObjectForEntityForName("UserObject", inManagedObjectContext: MOC!) as UserObject
            user_profile.setValue(gpa, forKey: "gpa")
            
        } else {
            println("There is data already")
            var managedObject = user_data[0]
            println(managedObject.gpa)
            managedObject.setValue(gpa, forKey: "gpa")
            
        }
        
        saveContext(MOC!)
    }
    
    func saveContext (moc : NSManagedObjectContext) {
        var error: NSError? = nil
        if moc.hasChanges && !moc.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sum: Double = 0.0
        var hours: Double = 0.0
        
        for x in 0...(grades.count - 1) {
            sum = sum + Double(units[x])*Double(grade[grades[x]]!)
            hours = hours + Double(units[x])
        }
        
        var gpa = sum/hours
        
        updateGPA(gpa)
        
        
        gpa_value.text = String(format:"%.2f", gpa)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
