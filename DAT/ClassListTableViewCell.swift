//
//  ClassListTableViewCell.swift
//  DAT
//
//  Created by Jyoti Bhardwaj on 6/12/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class ClassListTableViewCell: UITableViewCell {

    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var courseNum: UILabel!
    @IBOutlet var courseDept: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
