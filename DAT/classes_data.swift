//
//  classes_data.swift
//  DAT
//
//  Created by Adib Behjat on 6/1/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class classObject: NSManagedObject {
    @NSManaged var igetc_area : [Int] // IGETC Area
    @NSManaged var igetc_suba : [String] // IGETC Sub
    @NSManaged var department : String! // Department ID
    @NSManaged var course_num : String! // Course Number
    @NSManaged var course_unt : Double  // Course Units
    @NSManaged var course_tle : String! // Course Title
    @NSManaged var course_des : String! // Course Description
}