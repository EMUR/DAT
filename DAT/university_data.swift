//
//  university_data.swift
//  DAT
//
//  Created by Adib Behjat on 6/1/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class uniObject: NSManagedObject {
    @NSManaged var university_name : String! // Name
    @NSManaged var university_acrn : String! // Acronym
    @NSManaged var university_year : Int     // Year university
    @NSManaged var university_admn : Double  // Percentage representing admission rate of transfers
    @NSManaged var university_desc : String  // University Description
    @NSManaged var university_urla : String  // University URL
    @NSManaged var university_rank : Int     // Rank of university on US News
    @NSManaged var university_agpa : Double  // Avg GPA of transfers
}