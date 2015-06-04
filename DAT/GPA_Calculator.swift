//
//  GPA_Calculator.swift
//  DAT
//
//  Created by Adib Behjat on 6/3/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class GPA_Calculator: UIViewController {
    
    @IBOutlet var gpa_value: UILabel!

    
    var grades = ["A","B","Bp","C","Cp","Ap"]
    var units  = [5,4,3,3,5,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sum: Double = 0.0
        var hours: Double = 0.0
        
        for x in 0...(grades.count - 1) {
            sum = sum + Double(units[x])*Double(grade[grades[x]]!)
            hours = hours + Double(units[x])
        }
        
        var gpa = sum/hours
        println(gpa)
        
        gpa_value.text = String(format:"%.2f", gpa)
        
        
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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
