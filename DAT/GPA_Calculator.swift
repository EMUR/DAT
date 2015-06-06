//
//  GPA_Calculator.swift
//  DAT
//
//  Created by Adib Behjat on 6/3/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import SwiftCSV

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
