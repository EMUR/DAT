//
//  csv_importer.swift
//  DAT
//
//  Created by Adib Behjat on 6/6/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import Foundation

//FUNCTIONING CSV IMPORTER
var urlpath = NSBundle.mainBundle().pathForResource("users", ofType: "csv")

if let csvURL:NSURL = NSURL.fileURLWithPath(urlpath!) {
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: csvURL, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers  //=> ["id", "name", "age"]
        let alice = csv.rows[0]    //=> ["id": "1", "name": "Alice", "age": "18"]
        let bob = csv.rows[1]      //=> ["id": "2", "name": "Bob", "age": "19"]
        
        println(bob)
        
        // Columns
        let columns = csv.columns
        let names = csv.columns["name"]  //=> ["Alice", "Bob", "Charlie"]
        let ages = csv.columns["age"]    //=> ["18", "19", "20"]
    }
}