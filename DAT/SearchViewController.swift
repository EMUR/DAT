//
//  SearchViewController.swift
//  DAT
//
//  Created by E on 6/18/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData


class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var sections: UISegmentedControl!
    
    @IBOutlet weak var results: UITableView!
    var del:AppDelegate!
    var arr = [String]()
    var acr = [String]()
    

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.results.estimatedRowHeight = UITableViewAutomaticDimension
    }
    

    
    
    @IBOutlet weak var searchB: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchB.setImage(UIImage(named: "Search"), forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Normal)
        var textFieldInsideSearchBar = searchB.valueForKey("searchField") as? UITextField
        results.delegate = self
        results.dataSource = self
        self.searchB.delegate = self
        self.del = UIApplication.sharedApplication().delegate as AppDelegate
        
        textFieldInsideSearchBar?.textColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arr[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = UIColor(white: 0.4, alpha: 1.0)
        
        return cell
    }

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.BlackOpaque
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        arr.removeAll(keepCapacity: false)
        acr.removeAll(keepCapacity: false)

        searchBar.resignFirstResponder()
        
        var saveErr : NSError?
        let MOC = del.managedObjectContext
        
        var fetchRequest:NSFetchRequest!
        var results:[AnyObject]!
        
        
        println(sections.selectedSegmentIndex)

        
        if (sections.selectedSegmentIndex == 0)
        {
            fetchRequest = NSFetchRequest(entityName: "ClassObject")
            results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [classObject]
            for uni in results {
                if ((uni as classObject).course_tle.lowercaseString.rangeOfString(searchBar.text.lowercaseString) != nil)
                {
                    let str:String  = (uni as classObject).course_tle
                    
                        arr.append(str)
                }
            }

        }
        else
        {
            fetchRequest = NSFetchRequest(entityName: "UniObject")
            results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [UniObject]
            for uni in results {
                if ((uni as UniObject).uni_name.lowercaseString.rangeOfString(searchBar.text.lowercaseString) != nil)
                {
                    let str:String  = (uni as UniObject).uni_name
                    
                    arr.append(str)
                    acr.append((uni as UniObject).uni_acrn)
                }
            }

        }
        
        self.results.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.results.deselectRowAtIndexPath(indexPath, animated: true)
        
        if (sections.selectedSegmentIndex == 0)
        {
        performSegueWithIdentifier("click", sender: self)
        }
        else
        {
        performSegueWithIdentifier("explore_uni", sender: indexPath.row)
        }

    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "explore_uni"){
            let university_detail = segue.destinationViewController as universityProfileView
            university_detail.university_acronym = acr[sender as Int]
        } // End of segue identifier
    }

    
    @IBAction func indexChanged(sender:UISegmentedControl)
    {
        arr.removeAll(keepCapacity: false)
        acr.removeAll(keepCapacity: false)
        self.results.reloadData()
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
