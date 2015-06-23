//
//  Uni_cell.swift
//  DAT
//
//  Created by E on 6/10/15.
//  Copyright (c) 2015 Eyad_Neesha_Adeeb_Ehab. All rights reserved.
//

import UIKit

class Uni_cell: UICollectionViewCell {
    @IBOutlet weak var Uni_logo: UIImageView!
    
    var acron : String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init() {
        super.init()

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetUpImage(imgS:String, uni_acronym:String)
    {
        self.acron = uni_acronym
        Uni_logo.image = UIImage(named: imgS)
    }
    
   
}
