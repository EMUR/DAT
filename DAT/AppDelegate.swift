//
//  AppDelegate.swift
//  DAT
//
//  Created by E on 6/1/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // Override point for customization after application launch.
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchRequest = NSFetchRequest(entityName: "UniObject")
        let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [UniObject]
        if results.count == 0 {
            import_data_course()
            import_data_uni()
        } else {
            println("Database Active!")
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "DeAnzaCollege.DAT" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as NSURL
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("DAT", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("DAT.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
            coordinator = nil
            // Report any error we got.
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }
    
    func import_data_course() {
        
        var urlpath_c  = NSBundle.mainBundle().pathForResource("classes", ofType: "csv")
        
        // IMPORT ALL COURSES
        if let csvURL:NSURL = NSURL.fileURLWithPath(urlpath_c!) {
            
            var error: NSErrorPointer = nil
            
            if let csv = CSV(contentsOfURL: csvURL, error: error) {
                
                // Rows
                let rows = csv.rows.count
                var headers = csv.headers  //=> Shows the headers
                
                // Columns
                let columns = csv.columns
                let names = csv.columns["title"]  //=> [lists all class titles in an array]
                
                var line = csv.rows[0]      //=> [title: Composition and Reading, sub_area: A, description: Introduction to university level reading and writing❤️ with an emphasis on analysis. Close examination of a variety of texts (personal❤️ popular❤️ literary❤️ professional❤️ academic) from culturally diverse traditions. Practice in common rhetorical strategies used in academic writing. Composition of clear❤️ well-organized❤️ and well-developed essays❤️ with varying purposes and differing audiences❤️ from personal to academic., area: 1, course_num: 1A, dept: EWRT, units: 5]
                
                /*
                WHY THE HEARTS?
                Comma-separated value files do not have a set standard, and the file gets breaken down wherever a comma exists. The ❤️ is merely used to replace in text commas from the .CSV file, and it will later be substituted to a comma after it is collected
                */
                
                // Start the collection process
                
                var saveErr : NSError?
                
                // Variables
                let del = UIApplication.sharedApplication().delegate as AppDelegate!
                
                let MOC = del.managedObjectContext
                
                var fetchRequest = NSFetchRequest(entityName: "ClassObject")
                
                let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [classObject]
                
                
                if results.count == 0
                {
                    for i in 0...rows - 1 {
                        
                        var courses = NSEntityDescription.insertNewObjectForEntityForName("ClassObject", inManagedObjectContext: MOC!) as classObject
                        
                        // Get course area
                        courses.setValue(csv.rows[i]["area"]!, forKey: "igetc_area")
                        
                        // Get course sub-area
                        courses.setValue(csv.rows[i]["sub_area"]!, forKey: "igetc_suba")
                        
                        // Get course department
                        courses.setValue(csv.rows[i]["dept"]!, forKey: "department")
                        
                        // Get course number
                        courses.setValue(csv.rows[i]["course_num"]!, forKey: "course_num")
                        
                        // Get course title
                        let course_title = csv.rows[i]["title"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        courses.setValue(course_title, forKey: "course_tle")
                        
                        // Get course description
                        var course_description = csv.rows[i]["description"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        var course_des_string = course_description as NSString
                        var des_size = course_des_string.length
                        var last = Array(course_description)[des_size - 1]
                        
                        if String(last) != "." {
                            course_description = course_description + "."
                        }
                        
                        courses.setValue(course_description, forKey: "course_des")
                        
                        // Get course units
                        courses.setValue(csv.rows[i]["units"]!, forKey: "course_unt")
                        
                    }
                    // Save
                    saveContext(MOC!)
                }
                
            } // End of CSVBuild
            
        } // End of CSVPath for courses
        
    } //End import courses
    
    func import_data_uni() {
        
        var urlpath_u  = NSBundle.mainBundle().pathForResource("university", ofType: "csv")
        
        // IMPORT ALL UNIVERSITIES
        if let csvURL:NSURL = NSURL.fileURLWithPath(urlpath_u!) {
            
            var error: NSErrorPointer = nil
            
            if let csv = CSV(contentsOfURL: csvURL, error: error) {
                
                // Rows
                let rows = csv.rows.count
                
                // Start the collection process
                
                var saveErr : NSError?
                
                // Variables
                let del = UIApplication.sharedApplication().delegate as AppDelegate!
                
                let MOC = del.managedObjectContext
                
                var fetchRequest = NSFetchRequest(entityName: "UniObject")
                
                let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [UniObject]
                
                
                if results.count == 0
                {
                    for i in 0...rows - 1 {
                        
                        var university = NSEntityDescription.insertNewObjectForEntityForName("UniObject", inManagedObjectContext: MOC!) as UniObject
                        
                        // Get university name
                        university.setValue(csv.rows[i]["name"]!, forKey: "uni_name")
                        
                        // Get university acronym
                        university.setValue(csv.rows[i]["acronym"]!, forKey: "uni_acrn")
                        
                        // Get university founding year
                        university.setValue(csv.rows[i]["year_founded"]!, forKey: "uni_year")
                        
                        // Get university adminssion rate
                        university.setValue((csv.rows[i]["transfer_admission_rate"]! as NSString).doubleValue, forKey: "uni_admn")
                        
                        // Get university description
                        let university_description = csv.rows[i]["description"]!.stringByReplacingOccurrencesOfString("❤️", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        university.setValue(university_description, forKey: "uni_desc")
                        
                        // Get university rank
                        university.setValue(csv.rows[i]["us_rank"]!, forKey: "uni_rank")
                        
                        // Get university average transfer gpa
                        university.setValue((csv.rows[i]["average_gpa"]! as NSString).doubleValue, forKey: "uni_agpa")
                        
                        // Get university web address
                        university.setValue(csv.rows[i]["web_address"]!, forKey: "uni_urla")
                        
                        //Apply default course taken
                        university.setValue(csv.rows[i]["assist"]!, forKey: "uni_asst")
                    }
                    
                    // Save
                    saveContext(MOC!)
                    
                }
                
            } // End of CSVBuild
            
        } // End of CSVPath for universities
        
    } // End of Func
    
    func saveContext (moc : NSManagedObjectContext) {
        var error: NSError? = nil
        if moc.hasChanges && !moc.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
        }
    }
    
    func load_data(myMOC: NSManagedObjectContext) -> [classObject] {
        let fetchRequest = NSFetchRequest(entityName:"ClassObject")
        let fetchedResults = myMOC.executeFetchRequest(fetchRequest,error: nil) as [classObject]
        return fetchedResults
    }

}

