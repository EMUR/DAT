//
//  ChancesViewController.swift
//  DAT
//
//  Created by E on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class ChancesViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var GPA: UITextView!
    @IBOutlet weak var chance: UIView!
    var memory_gpa : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GPA.delegate = self
        
        //Retrieve Database information from the user
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchUserData = NSFetchRequest(entityName: "UserObject")
        var user_data = MOC?.executeFetchRequest(fetchUserData, error: &saveErr) as [UserObject]
        if user_data.count == 0 {
            GPA.text = (gpa.usr_gpa as NSNumber).stringValue
        } else {
            var user_gpa = user_data[0].gpa
            var string_gpa = user_gpa.stringValue
            string_gpa = string_gpa.substringToIndex(advance(minElement(indices(string_gpa)), 4))
            GPA.text = string_gpa
            gpa.usr_gpa = (string_gpa as NSString).doubleValue
            
            //Maintain the original GPA in termporary 'memory'
            memory_gpa = (string_gpa as NSString).doubleValue
        }
        // Do any additional setup after loading the view.
    }
    
    // When the user leaves this view, return it to student's original GPA
    override func viewDidDisappear(animated: Bool) {
        // Revert GPA to original value
        gpa.usr_gpa = memory_gpa
        GPA.text = (memory_gpa as NSNumber).stringValue
    }

    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = ""
    }
    
    func textViewDidChange(textView: UITextView) {
        switch((textView.text as NSString).length)
        {
        case 1:
            if (textView.text.toInt() < 0 || textView.text.toInt() > 4)
            {
                textView.text = ""
            }
            else
            {
                textView.text = "\(textView.text)."
            }
        case 4:
            textView.resignFirstResponder()
            
            gpa.usr_gpa = (self.GPA.text as NSString).doubleValue
            
            let vc = chance.subviews[0] as UITableView
            
            vc.reloadData()
            
        default:
            // Added measure to ensure that the user cannot input GPA's more than 4.0
            if ((textView.text as NSString).doubleValue > 4.0)
            {
                textView.text = ""
            }
            else
            {
                return
            }
        }
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
