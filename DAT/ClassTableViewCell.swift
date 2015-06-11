//
//  ClassTableViewCell.swift
//  DAT
//
//  Created by Jyoti Bhardwaj on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var courseDept: UILabel!
    @IBOutlet var courseNum: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
