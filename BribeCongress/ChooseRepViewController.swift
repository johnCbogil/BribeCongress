//
//  ChooseRepViewController.swift
//  BribeCongress
//
//  Created by John Bogil on 3/24/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class ChooseRepViewController: UIViewController {
    
    var state : State!
    
//    NSString *formattedString = [NSString stringWithFormat:@"http://www.opensecrets.org/api/?method=candContrib&cid=%@&cycle=2016&apikey=c152b047d8d1697d89d824f265d43df3&output=json", repID];

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
                 let repsDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                print(repsDict)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        sessionTask.resume()
    }
}
