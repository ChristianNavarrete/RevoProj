//
//  MyCollectionViewCell.swift
//  Revo_Project
//
//  Created by John on 8/2/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    public func configure(with model: Model) {        
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)

        //circle images
        self.myImageView.layer.borderWidth = 6
        self.myImageView.layer.masksToBounds = true
        self.myImageView.layer.borderColor = UIColor(red: 0, green: 0.7412, blue: 0.8392, alpha: 1.0).cgColor
        self.myImageView.layer.cornerRadius = self.myImageView.frame.height/2
        self.myImageView.clipsToBounds = true
    }
    

}
