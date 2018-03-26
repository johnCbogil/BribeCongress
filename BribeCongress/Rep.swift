//
//  Rep.swift
//  BribeCongress
//
//  Created by John Bogil on 3/24/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import Foundation
import SwiftyJSON

class Rep {
    
    var bioguideID : String?
    var birthday : String?
    var facebook : String?
    var firstElected : String?
    var fullName : String?
    var gender : String?
    var office : String?
    var lastName : String?
    var party : String?
    var phone : String?
    var twitter : String?
    var webform : String?
    var website : String?
    var youtube : String?
    
    init(with dict:JSON) {
        print(dict)
//        bioguideID = dict["bioguide_id"].stringValue
//        birthday = dict["birthdate"]?.stringValue
//        facebook = dict["facebook_id"]?.stringValue
//        firstElected = dict["first_elected"]?.stringValue
//        fullName = dict["firstlast"]?.stringValue
//        gender = dict["gender"]?.stringValue
//        office = dict["office"]?.stringValue
//        lastName = dict["lastname"]?.stringValue
//        party = dict["party"]?.stringValue
//        phone = dict["phone"]?.stringValue
//        twitter = dict["twitter_id"]?.stringValue
//        webform = dict["webform"]?.stringValue
//        website = dict["website"]?.stringValue
//        youtube = dict["youtube_url"]?.stringValue
    }
}
