//
//  myCollectionViewCell.swift
//  Revo_Project
//
//  Created by John on 8/3/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NewCollectionViewCell", bundle: nil)
    }

}
