//
//  CourseTaken.swift
//  DAT
//
//  Created by Adib Behjat on 6/21/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import Foundation
import CoreData

class CourseTaken: NSManagedObject {

    @NSManaged var class_area: String       // Class Area
    @NSManaged var class_grade: String      // Grade received by the user for the class
    @NSManaged var class_quarter: String    // Which quarter the user is planning to get it
    @NSManaged var class_dept: String       // Class department
    @NSManaged var class_number: String     // Class number
    @NSManaged var class_units: NSNumber    // Class units (in Double)

}
