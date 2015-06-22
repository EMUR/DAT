//
//  ProfileViewController.swift
//  DAT
//
//  Created by Adib Behjat on 6/22/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var profle_name: UILabel!
    @IBOutlet weak var current_gpa: UILabel!
    @IBOutlet weak var total_units: UILabel!
    @IBOutlet weak var university_goal: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchUserData = NSFetchRequest(entityName: "UserObject")
        var user_data = MOC?.executeFetchRequest(fetchUserData, error: &saveErr) as [UserObject]
        
        if user_data.count != 0 {
            profle_name.text = user_data[0].name
            current_gpa.text = user_data[0].gpa.stringValue
            university_goal.image  = UIImage(named: user_data[0].uni_choice + "L")
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
