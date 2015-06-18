//
//  classObject.swift
//  
//
//  Created by E on 6/10/15.
//
//

import Foundation
import CoreData

class classObject: NSManagedObject {
    
    @NSManaged var course_des: String //Course Description
    @NSManaged var course_num: String //Course Number
    @NSManaged var course_tle: String //Course Title
    @NSManaged var course_unt: String //Course Unit
    @NSManaged var department: String //Course Department
    @NSManaged var igetc_area: String //Course IGETC Area
    @NSManaged var igetc_suba: String //Course IGETC Sub Area
    
}
