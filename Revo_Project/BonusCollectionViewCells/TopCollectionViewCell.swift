//
//  TopCollectionViewCell.swift
//  Revo_Project
//
//  Created by John on 8/3/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with name:String) {
        topLabel.text = name
    }

}
