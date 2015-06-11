//
//  Uni_List.swift
//  DAT
//
//  Created by E on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class Uni_List: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var MainCollection: UICollectionView!
    
    var Uni_Arrays = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCollection.delegate = self
        MainCollection.dataSource = self
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        
        visualEffectView.frame = self.view.frame
        
        self.view.viewWithTag(1)?.addSubview(visualEffectView)
        
        
        Uni_Arrays = ["UCB", "UCL", "UCD", "UCSD", "UCSC", "UCSF", "UCI", "UCSB"]
        
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = MainCollection.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath:indexPath) as Uni_cell
                
        cell.SetUpImage("\(Uni_Arrays[indexPath.row])L")
        
      
        return cell
    }
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let w = UIScreen.mainScreen().bounds.width/2
        return CGSize(width: w, height: w)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Uni_Arrays.count
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
