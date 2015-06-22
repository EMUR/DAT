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
    
    // User's calculated GPA
    @NSManaged var gpa: NSNumber
    
    // User's name
    @NSManaged var name: String
    
    // University choice
    @NSManaged var uni_choice: String
    
}
