//
//  UniTableViewCell.swift
//  DAT
//
//  Created by Adib Behjat on 6/21/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class UniTableViewCell: UITableViewCell {

    @IBOutlet weak var uni_name: UILabel!
    @IBOutlet weak var uni_logo: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
