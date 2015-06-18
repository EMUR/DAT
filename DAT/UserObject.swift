//
//  UserObject.swift
//  DAT
//
//  Created by Adib Behjat on 6/17/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import Foundation
import CoreData

class UserObject: NSManagedObject {
    
    // First name of the user
    @NSManaged var first_name: String
    
    // Last name of the user
    @NSManaged var last_name: String
    
    // A course id that which represents the ID of the courses table, which includes courses, grade, and the quarter the courses will be taken
    @NSManaged var courses_id: String
    
    // Users calculated GPA
    @NSManaged var gpa: NSNumber
    
    // University choices
    @NSManaged var uni_choice: AnyObject
    
}
