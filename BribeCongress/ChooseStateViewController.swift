//
//  ChooseStateViewController.swift
//  BribeCongress
//
//  Created by John Bogil on 3/22/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class ChooseStateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stateCodesArray = [String]()
    var stateNamesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readStateNames()
        self.configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func readStateNames() {
        // Extract the json
        if let path = Bundle.main.path(forResource: "States", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let statesDict = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! Dictionary<String, String>
                stateNamesArray.append(contentsOf: statesDict.values)
                stateNamesArray = stateNamesArray.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
                stateCodesArray.append(contentsOf: statesDict.keys)
                print(statesDict)
            } catch {
                // handle error
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateNamesArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = stateNamesArray[indexPath.row]
        return cell
    }
}
