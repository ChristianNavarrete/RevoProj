//
//  PageThreeViewController.swift
//  Revo_Project
//
//  Created by John on 8/2/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

class BonusViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    var scrollWidth:CGFloat = 0.0
    
    var myTableView = UITableView()
    var myCollectionView:UICollectionView?
    
    var topCollectionData = ["Page One","Page Two"]
    
    var x = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        
        myScrollView.delegate = self
        
        //scrollView
        for i in 0...1 {
            if i == 0 {
                //add tableView
                self.x = view.frame.midX + view.frame.width * CGFloat(i)
                
                self.scrollWidth += view.frame.width
                
                self.myScrollView.addSubview(myTableView)
                
                myTableView.frame = CGRect(x: x - 200, y: 10 , width: self.view.frame.width - 15, height: self.view.frame.height - 220)
                myTableView.delegate = self
                myTableView.dataSource = self
                myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
                myTableView.showsVerticalScrollIndicator = false

                
                print(x)
            }else{
                //add collectionView
                self.x = view.frame.midX + view.frame.width * CGFloat(i)
                
                self.scrollWidth += view.frame.width
                
                let flowLayout = UICollectionViewFlowLayout()
                flowLayout.scrollDirection = .vertical
                flowLayout.itemSize = CGSize(width: 180, height: 200)
                flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)

                let collectionFrame = CGRect(x: x - 200, y: 10 , width: self.view.frame.width - 15, height: self.view.frame.height - 220)
                
                self.myCollectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: flowLayout)
                myCollectionView?.register(NewCollectionViewCell.nib(), forCellWithReuseIdentifier: "myCell")
                
                myCollectionView?.delegate   = self
                myCollectionView?.dataSource = self
                myCollectionView?.showsVerticalScrollIndicator = false
                myCollectionView?.backgroundColor = UIColor.clear
                                
                self.myScrollView.addSubview(myCollectionView!)
               
                print(x)
            }
            
            //setContentSize for scroll view
            self.myScrollView.contentSize = CGSize(width: scrollWidth, height: self.view.frame.height)
        }
        
    }
    //MARK: - ScrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //update page control
        myPageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
        
        //update buttons
        if scrollView.contentOffset.x >= 414 {
            //if user scrolls to second collection view update top collectionView buttons
            let topButton = self.topCollectionView.cellForItem(at: IndexPath(item: 1, section: 0))
            topButton?.backgroundColor = UIColor.black
            
            let topButton2 = self.topCollectionView.cellForItem(at: IndexPath(item: 0, section: 0))
            topButton2?.backgroundColor = UIColor.gray
        }else{
            //if user scrolls to second collection view update top collectionView buttons
            let topButton = self.topCollectionView.cellForItem(at: IndexPath(item: 0, section: 0))
            topButton?.backgroundColor = UIColor.black
            
            let topButton2 = self.topCollectionView.cellForItem(at: IndexPath(item: 1, section: 0))
            topButton2?.backgroundColor = UIColor.gray
        }
        

    }
    
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.myCollectionView {
            return 10
        }else{
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if collectionView == self.topCollectionView {
            if let c = topCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TopCollectionViewCell {
                c.configure(with: topCollectionData[indexPath.row])
                cell = c
            }
            if indexPath.row == 0 {
                cell.backgroundColor = UIColor.black
            }
        }else{
            let cell = myCollectionView!.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? NewCollectionViewCell
            return cell!
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.topCollectionView {
            if indexPath.row == 0 {
                print("Clicked on first button")
                
                //make selected cell gray
                let cell = collectionView.cellForItem(at: indexPath)
                cell?.backgroundColor = UIColor.black
                
                //make other cell black
                let indexPath = IndexPath(item: 1, section: 0)
                let otherCell = collectionView.cellForItem(at: indexPath)
                otherCell?.backgroundColor = UIColor.gray
                
                //update scrollView
                myScrollView.setContentOffset(CGPoint.zero, animated: true)
                
               
            }
            
            if indexPath.row == 1 {
                //make selected cell gray
                print("Clicked on second button")
                let cell = collectionView.cellForItem(at: indexPath)
                cell?.backgroundColor = UIColor.black
                
                //make other cell black
                let indexPath = IndexPath(item: 0, section: 0)
                let otherCell = collectionView.cellForItem(at: indexPath)
                otherCell?.backgroundColor = UIColor.gray
                
                //update scrollView
                myScrollView.setContentOffset(CGPoint(x: 414, y: 0), animated: true)
                

            }
            
        }else{
            
            print("TAPPED ON SECOND COLLECTION")
            
        }
    }
    
    //MARK: - TableView Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed("BonusTableViewCell", owner: self, options: nil)?.first as? BonusTableViewCell
        else {fatalError("Unable to create cell")}
        //cell.configure(with: models2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
