//
//  LogoViewController.swift
//  DAT
//
//  Created by E on 6/22/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit
import CoreData

class LogoViewController: UIViewController {
    
    var user : [UserObject] = []

    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.navigationBarHidden = true

        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.logo.alpha = 1.0
            }) { (done:Bool) -> Void in
            UIView.animateWithDuration(2.0, animations: { () -> Void in
                self.logo.alpha = 0.0
                }, completion: { (done2:Bool) -> Void in
                    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("IntroViewController") as IntroViewController
                    self.navigationController?.pushViewController(vc, animated: false)
            })
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
