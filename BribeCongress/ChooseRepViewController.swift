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
    
    var state : State!
    var repsArray : Array<Rep>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchReps()
        self.title = state.name
    }
    
    func fetchReps() {
        guard let url = URL(string: "https://www.opensecrets.org/api/?method=getLegislators&id=\(state.code)&apikey=c152b047d8d1697d89d824f265d43df3&output=json") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    let openSecretsResponse = try JSONDecoder().decode(OSResponse.self, from: data)
                    let legislators = openSecretsResponse.response.legislator
                    print(legislators)
                    for legislator in legislators {
                        for (key,value) in legislator {
                            
                        }
                    }
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    func switchKey<T, U>(_ myDict: inout [T:U], fromKey: T, toKey: T) {
        if let entry = myDict.removeValue(forKey: fromKey) {
            myDict[toKey] = entry
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
    }
}
