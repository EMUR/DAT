//
//  AreaCustomCell.swift
//  DAT
//
//  Created by E on 6/3/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class AreaCustomCell: UITableViewCell {
    @IBOutlet weak var ClassesCount: UILabel!
    @IBOutlet weak var AreaText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 2.0
        // Initialization code
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
