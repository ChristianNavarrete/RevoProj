//
//  SecondCustomCell.swift
//  Revo_Project
//
//  Created by John on 8/2/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

class SecondCustomCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var models = [Model]()
    
    override func awakeFromNib() {
        myCollectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.backgroundColor = UIColor.black
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondCustomCell", bundle: nil)
    }
    
    func configure(with models: [Model]) {
        self.models = models
        self.myCollectionView.reloadData()
    }
    
    // MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.configure(with: models[indexPath.row])
        cell.myLabel.text = String(indexPath.row + 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}
