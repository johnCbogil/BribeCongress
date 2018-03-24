//
//  State.swift
//  BribeCongress
//
//  Created by John Bogil on 3/24/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class State {
    
    var code : String
    var name : String

    init(with stateName:String, stateCode:String) {
        code = stateCode
        name = stateName
    }
}
