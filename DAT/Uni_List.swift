//
//  Uni_List.swift
//  DAT
//
//  Created by E on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class Uni_List: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var MainCollection: UICollectionView!
    
    var Uni_Arrays = [String]()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCollection.delegate = self
        MainCollection.dataSource = self
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        
        visualEffectView.frame = self.view.frame
        
        self.view.viewWithTag(1)?.addSubview(visualEffectView)
        
        // Retrieve University Data
        var saveErr : NSError?
        let del = UIApplication.sharedApplication().delegate as AppDelegate!
        let MOC = del.managedObjectContext
        var fetchRequest = NSFetchRequest(entityName: "UniObject")
        let results = MOC?.executeFetchRequest(fetchRequest, error: &saveErr) as [UniObject]
        
        // Go through the results and append the logo names
        for i in 0...results.count - 1 {
            let image_label = results[i].uni_acrn + "LB"
            Uni_Arrays.append(image_label)
        }
        
        // Sort the Array
        Uni_Arrays.sort {
            return $0 < $1
        }
        
        // Testing purposes
        // println(Uni_Arrays) //[UCBLB, UCDLB, UCILB, UCLALB, UCMLB, UCRLB, UCSBLB, UCSCLB, UCSDLB]
        
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = MainCollection.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath:indexPath) as Uni_cell
        
        var university_acrn = Uni_Arrays[indexPath.row]
        university_acrn = dropLast(dropLast(university_acrn))
        
        cell.SetUpImage("\(Uni_Arrays[indexPath.row])", uni_acronym: university_acrn)
      
        return cell
    }
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let w = UIScreen.mainScreen().bounds.width/2
        return CGSize(width: w, height: w)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Check for indexpath and cell
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
            
            // Conduct segue
            performSegueWithIdentifier("explore_uni", sender: cell)
            
        } else {
            // Call Error
            println("Segue process failed hard!")
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Uni_Arrays.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "explore_uni"){
            let university_detail = segue.destinationViewController as universityProfileView
            let cell = sender as Uni_cell
            university_detail.university_acronym = cell.acron
        } // End of segue identifier
    }
}
