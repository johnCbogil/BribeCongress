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
    
    var statesArray = [State]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readStateNames()
        self.configureTableView()
        self.title = "Which State Would You Like To View?"
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
                let jsonResultDict = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! Dictionary<String,String>
                for dict in jsonResultDict {
                    let state : State = State.init(with: dict.value, stateCode: dict.key)
                    statesArray.append(state)
                }
                statesArray = statesArray.sorted {$0.name < $1.name}
            } catch {
                // handle error
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statesArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let state : State = statesArray[indexPath.row]
        cell.textLabel?.text = state.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(statesArray[indexPath.row].code)
        let chooseRepVC : ChooseRepViewController = self.storyboard!.instantiateViewController(withIdentifier: "ChooseRepViewController") as! ChooseRepViewController
        self.navigationController?.pushViewController(chooseRepVC, animated: true)
    }
}
