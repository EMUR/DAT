//
//  universityProfileView.swift
//  DAT
//
//  Created by E on 6/5/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class universityProfileView: UITableViewController {
    @IBOutlet weak var uni_background: UIImageView!
    @IBOutlet weak var uni_desc: UITextView!
    @IBOutlet weak var uni_city: UILabel!
    @IBOutlet weak var uni_rank: UILabel!
    @IBOutlet weak var uni_avgpa: UILabel!
    @IBOutlet weak var uni_logo: UIImageView!
    var expanded = false
    var cellH : CGFloat = 60.0
    
    @IBOutlet var uni_map: MKMapView!
    
    var results : [UniObject] = []
    
    //For Geo code purposes
    var university_name : String!
    var coords: CLLocationCoordinate2D?
    
    override func viewWillLayoutSubviews() {
        self.tableView.backgroundColor = UIColor.clearColor()
    }
    
    //For DB purposes
    var university_acronym : String!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.rowHeight = UITableViewAutomaticDimension
        /* Conduct DB request */
        
        self.uni_desc.setContentOffset(CGPoint(x: 100, y: 100), animated: true)
        // Create Request
        var request = NSFetchRequest(entityName: "UniObject")
        request.returnsObjectsAsFaults = false;
        
        // Set SQL WHERE command
        let resultsPredicate = NSPredicate(format: "uni_acrn = %@", university_acronym)
        request.predicate = resultsPredicate
        
        // Build Delegate and App
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var saveErr : NSError?
        results = MOC?.executeFetchRequest(request, error: &saveErr) as [UniObject]
        
        /* End DB request */
        
        
        /* Feed data points */
        uni_logo.image  = UIImage(named: university_acronym + "L")
        var university_info = results[0].uni_desc
        university_info = dropFirst(university_info)
        university_info = dropLast(university_info)
        uni_desc.text = university_info
        uni_rank.text = results[0].uni_rank
        uni_avgpa.text = "\(results[0].uni_agpa)"
        
        var url_link = results[0].uni_urla
        
        // Get city name only
        var uc_title  = "University of California - "
        var uc_t_size = distance(uc_title.startIndex, uc_title.endIndex)
        var uc_name  = results[0].uni_name
        uni_city.text = uc_name.substringFromIndex(advance(minElement(indices(uc_name)), uc_t_size))
        
        /* End feed data points */
        
        /* START GEO DATA PARSER */
        
        let geoCoder = CLGeocoder()
        university_name = results[0].uni_name
        var address = "\(university_name), California, United States of America"
        //var address = "University of California - Berkeley, California, USA
        
        uni_map.mapType = MKMapType.Satellite
        
        geoCoder.geocodeAddressString(address,
            completionHandler:
            {(placemarks: [AnyObject]!, error: NSError!) in
                
                if error != nil {
                    println("Geocode failed with error: \(error.localizedDescription)")
                }
                
                if placemarks.count > 0 {
                    let placemark = placemarks[0] as CLPlacemark
                    let location = placemark.location
                    self.coords = location.coordinate
                }
                
                // Set the location and show it on the map
                let location = CLLocationCoordinate2D(
                    latitude: self.coords!.latitude,
                    longitude: self.coords!.longitude
                )
                
                let span = MKCoordinateSpanMake(1/69.0, 1/69.0) // 1 degree is approx 69 miles. Therefore, 0.5mile x 0.5mile map, then the value is 0.5/69
                let region = MKCoordinateRegion(center: location, span: span)
                self.uni_map.setRegion(region, animated: false)
                
        })
        
        // END GEO DATA PARSER

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBAction func uni_weblink(sender: AnyObject) {
        if let url = NSURL(string: results[0].uni_urla) {
            UIApplication.sharedApplication().openURL(url)
        }
    }

    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y < -100.0)
        {

            UIView.animateWithDuration(0.3, animations: { () -> Void in
                 self.tableView.transform = CGAffineTransformTranslate(self.tableView.transform, 0.0, self.tableView.bounds.height - 100.0)
                }, completion: { (done:Bool) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
            })
            

        }
    }
    // MARK: - Table view data source


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
