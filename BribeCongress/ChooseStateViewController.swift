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
    var stateNamesDict: [String: AnyObject] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

       self.readStateNames()
        
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
                stateNamesDict = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! Dictionary<String, AnyObject>
                print(stateNamesDict)
            } catch {
                // handle error
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
}
