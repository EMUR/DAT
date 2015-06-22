//
//  IntroViewController.swift
//  DAT
//
//  Created by E on 6/22/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

struct Username
{
    static var name = "Default"
}

class IntroViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var hey: UILabel!
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var whar: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        
 
        
        
        self.navigationController?.navigationBarHidden = true
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.hey.alpha = 1.0
            }) { (done:Bool) -> Void in
                UIView.animateWithDuration(2.0, animations: { () -> Void in
                    self.whar.alpha = 1.0
                    }, completion: { (done2:Bool) -> Void in
                        UIView.animateWithDuration(1.0, animations: { () -> Void in
                            self.line.alpha = 1.0
                            }, completion: { (done3:Bool) -> Void in
                                self.active()
                        })
                })
        }
        
        // Do any additional setup after loading the view.
    }
    
    func active()
    {
        self.name.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        name.resignFirstResponder()
        Username.name = self.name.text
        
        
        let vc = storyboard?.instantiateViewControllerWithIdentifier("ChooseUniTableViewController") as ChooseUniTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
        return true
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
