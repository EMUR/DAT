//
//  ClassDetails.swift
//  DAT
//
//  Created by E on 6/18/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class ClassDetails: UIViewController {
    @IBOutlet weak var classtitle: UILabel!

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var cUnits: UILabel!
    @IBOutlet weak var cNum: UILabel!
    @IBOutlet weak var dep: UILabel!
    @IBOutlet weak var Desc: UITextView!
    var classInfo : classObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.card.layer.cornerRadius = 15.0
        self.card.clipsToBounds = true
        self.navigationController?.navigationBarHidden = false
        self.classtitle.text = classInfo.course_tle
        self.Desc.text = classInfo.course_des
        self.dep.text = classInfo.department
        self.cNum.text = classInfo.course_num
        self.cUnits.text = classInfo.course_unt
        self.Desc.setContentOffset(CGPoint(x: 100, y: 100), animated: true)

        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.translucent = false
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dissmiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
