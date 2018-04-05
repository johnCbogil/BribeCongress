//
//  RepDetailViewController.swift
//  BribeCongress
//
//  Created by John Bogil on 4/5/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class RepDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var rep: Rep! = nil
    @IBOutlet weak var tableView: UITableView!
    var dataSourceArray: Array<Any> = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = rep.fullName
        
        NetworkManager.sharedInstance.fetchContributorsForRep(repID: rep.cID) { (json) in
            print(json)
        }
        
        NetworkManager.sharedInstance.fetchContributorsByIndusryForRep(repID: rep.cID) { (json) in
            print(json)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = repsArray[indexPath.row].fullName
        return cell
    }
}
