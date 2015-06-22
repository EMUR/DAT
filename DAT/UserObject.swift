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
    
    // Users calculated GPA
    @NSManaged var gpa: NSNumber
    
    @NSManaged var name: String
    
    // University choices
    @NSManaged var uni_choice: AnyObject
    
}
