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
        let url : URL = URL.init(string:"https://www.opensecrets.org/api/?method=getLegislators&id=\(state.code)&apikey=c152b047d8d1697d89d824f265d43df3&output=json")!
        var request : URLRequest = URLRequest.init(url: url)
        request.httpMethod = "GET"
        
        let sessionConfig : URLSessionConfiguration = URLSessionConfiguration.default
        let session : URLSession = URLSession.init(configuration: sessionConfig)
        let sessionTask = session.dataTask(with: request) { (data, response, error) in

            // parse the result as JSON, since that's what the API provides
            do {
                let json = JSON(data: data!)
                print(json)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        sessionTask.resume()
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
