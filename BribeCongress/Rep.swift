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
    var bioguideID: String
    var birthday: String
    var facebook: String
    var firstElected: String
    var fullName: String
    var gender: String
    var office: String
    var lastName: String
    var party: String
    var phone: String
    var twitter: String
    var webform: String
    var website: String
    var youtube: String
    
    init(with json:JSON) {
        
        bioguideID = json["bioguide_id"].stringValue
        birthday = json["birthdate"].stringValue
        facebook = json["facebook_id"].stringValue
        firstElected = json["first_elected"].stringValue
        fullName = json["firstlast"].stringValue
        gender = json["gender"].stringValue
        office = json["office"].stringValue
        lastName = json["lastname"].stringValue
        party = json["party"].stringValue
        phone = json["phone"].stringValue
        twitter = json["twitter_id"].stringValue
        webform = json["webform"].stringValue
        website = json["website"].stringValue
        youtube = json["youtube_url"].stringValue
    }
}
