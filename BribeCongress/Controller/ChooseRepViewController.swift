//
//  ChooseRepViewController.swift
//  BribeCongress
//
//  Created by John Bogil on 3/24/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit
import SwiftyJSON

class ChooseRepViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var state: State!
    var repsArray: Array <Rep>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchReps()
        self.title = state.name
        repsArray = []
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchReps() {
        NetworkManager.sharedInstance.fetchLegislatorsForState(state: self.state.code) {
            (json) in
            
            let response = json["response"]
            let legislators = response["legislator"].arrayValue
            for legislator in legislators {
                let rep = Rep.init(with: legislator["@attributes"])
                self.repsArray.append(rep)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = repsArray[indexPath.row].fullName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let storyboard : UIStoryboard = self.storyboard {
            let repDetailVC : RepDetailViewController = storyboard.instantiateViewController(withIdentifier: "RepDetailViewController") as! RepDetailViewController
            repDetailVC.rep = repsArray[indexPath.row]
            self.navigationController?.pushViewController(repDetailVC, animated: true)
        }
    }
}
