//
//  SetUpViewController.swift
//  DAT
//
//  Created by E on 6/22/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class SetUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate!
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("UserObject",inManagedObjectContext:managedContext)
        
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext) as UserObject
        
        person.setValue(Username.name, forKey: "name")
        person.setValue(Colleges.name.uni_acrn, forKey: "uni_choice")
        person.setValue(3.71, forKey: "gpa")
        
        var error: NSError?
        
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
            
        else
        {
            self.performSegueWithIdentifier("Start", sender: nil)
            
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
