//
//  BonusTableViewCell.swift
//  Revo_Project
//
//  Created by John on 8/3/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

class BonusTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.myImage.layer.borderWidth = 6
        self.myImage.layer.masksToBounds = true
        self.myImage.layer.borderColor = UIColor(red: 0.9882, green: 0.3137, blue: 0.3255, alpha: 1.0).cgColor
        self.myImage.layer.cornerRadius = self.myImage.frame.height/2
        self.myImage.clipsToBounds = true
    }


    
}
