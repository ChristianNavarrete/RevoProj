//
//  PartOneViewController.swift
//  Revo_Project
//
//  Created by John on 7/31/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit

//CollectionView Data Struct
struct Model {
    let text:String
    let imageName:String
    
    init(text:String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}

class PartOneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //TABLE DATA
    var models = [Model]()
    var models2 = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadModels()

        // Do any additional setup after loading the view.
        self.tableView.register(SecondCustomCell.nib(), forCellReuseIdentifier: "SecondCustomCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.black
    }
    
    // MARK: - TABLE VIEW METHODS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = Bundle.main.loadNibNamed("FirstCustomCell", owner: self, options: nil)?.first as? FirstCustomCell
            else {fatalError("Unable to create cell")}
            cell.titleLabel.text = "Best New Music"
            cell.backgroundColor = UIColor.black
            return cell
        }else if indexPath.section == 1 {
            guard let cell = Bundle.main.loadNibNamed("SecondCustomCell", owner: self, options: nil)?.first as? SecondCustomCell
            else {fatalError("Unable to create cell")}
            cell.configure(with: models)
            cell.backgroundColor = UIColor.black

            return cell
        }
        
        guard let cell = Bundle.main.loadNibNamed("SecondCustomCell", owner: self, options: nil)?.first as? SecondCustomCell
        else {fatalError("Unable to create cell")}
        cell.configure(with: models2)
        cell.backgroundColor = UIColor.black
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Welcome"
        }
        if section == 1 {
            return "Top Artists"
        }
        return "Upcoming Artists"
    }
    
    func loadModels() {
        //First collection view
        for _ in 0...10 {
            models.append(Model(text: "text", imageName: "image1"))
        }
        
        for _ in 0...65 {
           models2.append(Model(text: "text", imageName: "image1"))
        }
        
    }
}

