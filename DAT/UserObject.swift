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
    
    // Users calculated GPA
    @NSManaged var gpa: NSNumber
    
    // University choices
    @NSManaged var uni_choice: AnyObject
    
}
