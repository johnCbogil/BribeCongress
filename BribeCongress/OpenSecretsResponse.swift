//
//  OpenSecretsResponse.swift
//  BribeCongress
//
//  Created by John Bogil on 4/4/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import Foundation

struct OSResponse: Decodable {
    struct Response: Decodable {
        struct Legislator: Decodable {
            
        }
        let legislator: [Legislator]
    }
    let response: Response
}
