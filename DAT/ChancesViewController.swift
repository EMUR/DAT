//
//  ChancesViewController.swift
//  DAT
//
//  Created by E on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class ChancesViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var GPA: UITextView!
    @IBOutlet weak var chance: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        GPA.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = ""
    }
    
    func textViewDidChange(textView: UITextView) {
        switch((textView.text as NSString).length)
        {
        case 1:
            if (textView.text.toInt() < 0 || textView.text.toInt() > 4)
            {
                textView.text = ""
            }
            else
            {
            textView.text = "\(textView.text)."
            }
        case 4:
            textView.resignFirstResponder()
            
            gpa.usr_gpa = (self.GPA.text as NSString).doubleValue
            
            let vc = chance.subviews[0] as UITableView
            
            vc.reloadData()
            
        default:
            return
        }
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
