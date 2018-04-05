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
    var repsArray : Array <Rep>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchReps()
        self.title = state.name
        repsArray = []
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchReps() {
        guard let url = URL(string: "https://www.opensecrets.org/api/?method=getLegislators&id=\(state.code)&apikey=c152b047d8d1697d89d824f265d43df3&output=json") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let json = JSON(data: data)
                let response = json["response"]
                let legislators = response["legislator"].arrayValue
                for legislator in legislators {
                    let rep = Rep.init(with: legislator["@attributes"])
                    print(rep.fullName)
                    self.repsArray.append(rep)
                }
            }
            }.resume()
        self.tableView.reloadData()
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
    }
}
