//
//  UniObject.swift
//  DAT
//
//  Created by Adib Behjat on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import Foundation
import CoreData

class UniObject: NSManagedObject {

    @NSManaged var uni_name: String     //University Name
    @NSManaged var uni_acrn: String     //University Acronym
    @NSManaged var uni_year: String     //University Year
    @NSManaged var uni_admn: NSNumber   //University Admission
    @NSManaged var uni_desc: String     //University Description
    @NSManaged var uni_urla: String     //University URL Address
    @NSManaged var uni_rank: String     //University U.S. News Rank
    @NSManaged var uni_agpa: NSNumber   //University average admittance
    @NSManaged var uni_asst: String     //University Assist URL address from De Anza

}
