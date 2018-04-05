//
//  NetworkManager.swift
//  BribeCongress
//
//  Created by John Bogil on 4/5/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    func fetchLegislatorsForState(state: String, completion: @escaping (JSON) -> ()) {
        guard let url = URL(string: "https://www.opensecrets.org/api/?method=getLegislators&id=\(state)&apikey=c152b047d8d1697d89d824f265d43df3&output=json") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let json = JSON(data: data)
                
                completion(json)
                
                
                
                //                let json = JSON(data: data)
                //                let response = json["response"]
                //                let legislators = response["legislator"].arrayValue
                //                for legislator in legislators {
                //                    let rep = Rep.init(with: legislator["@attributes"])
                //                    print(rep.fullName)
                //                    self.repsArray.append(rep)
            }
            //            }
            }.resume()
    }
}
