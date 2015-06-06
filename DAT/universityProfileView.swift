//
//  universityProfileView.swift
//  DAT
//
//  Created by E on 6/5/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import MapKit

class universityProfileView: UITableViewController {
    @IBOutlet weak var uni_background: UIImageView!
    @IBOutlet weak var uni_weblink: UIButton!
    @IBOutlet weak var uni_desc: UITextView!
    @IBOutlet weak var uni_rank: UILabel!
    @IBOutlet weak var uni_avgpa: UILabel!
    @IBOutlet var uni_map: MKMapView!
    
    //GEO CODE PURPOSES
    var university_name : String!
    var coords: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // START GEO DATA PARSER
        
        let geoCoder = CLGeocoder()
        university_name = "University of California, Berkeley"
        //var address = "\(university_name), California, United States of America"
        var address = "University of California - Berkeley, California, USA"
        
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
                
                let span = MKCoordinateSpanMake(0.5/69.0, 0.5/69.0) // 1 degree is approx 69 miles. Therefore, 0.5mile x 0.5mile map, then the value is 0.5/69
                let region = MKCoordinateRegion(center: location, span: span)
                self.uni_map.setRegion(region, animated: true)
                
        })
        
        // END GEO DATA PARSER

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

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
