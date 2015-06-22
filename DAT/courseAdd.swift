//
//  courseAdd.swift
//  DAT
//
//  Created by Adib Behjat on 6/22/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class addmyCourse {
    
    func addCourse(class_area: String, class_grade: String, class_quarter: String, class_dept: String, class_number: String, class_units: Double) {
        
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var courseTaken = NSEntityDescription.insertNewObjectForEntityForName("UserObject", inManagedObjectContext: MOC!) as CourseTaken
        
        // Add the courses
        courseTaken.setValue(class_area, forKey: "class_area")
        courseTaken.setValue(class_grade, forKey: "class_grade")
        courseTaken.setValue("1", forKey: "class_quarter")
        courseTaken.setValue(class_dept, forKey: "class_dept")
        courseTaken.setValue(class_number, forKey: "class_number")
        courseTaken.setValue(class_units, forKey: "class_units")
        
        if MOC!.hasChanges && MOC!.save(&saveErr) {
            NSLog("Unresolved error \(saveErr), \(saveErr!.userInfo)")
        } else {
            println("Successfully added class!")
        } // End of Save
        
    } // End of addCourse
    
}
