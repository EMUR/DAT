//
//  DAT.swift
//  DAT
//
//  Created by Adib Behjat on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import Foundation
import CoreData

class classObject: NSManagedObject {

    @NSManaged var course_des: String
    @NSManaged var course_grd: String
    @NSManaged var course_num: String
    @NSManaged var course_tkn: NSNumber
    @NSManaged var course_tle: String
    @NSManaged var course_unt: String
    @NSManaged var department: String
    @NSManaged var igetc_area: String
    @NSManaged var igetc_suba: String

}
