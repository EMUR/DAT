//
//  CourseTaken.swift
//  DAT
//
//  Created by Adib Behjat on 6/17/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import Foundation
import CoreData

class CourseTaken: NSManagedObject {

    @NSManaged var class_id: String         // Holds the ObjectID of the classes to easily call the classes
    @NSManaged var course_grade: String     // Contains the course grade in the format Ap, A, Am...etc
    @NSManaged var course_quarter: NSNumber // Course quarter an integer

}
