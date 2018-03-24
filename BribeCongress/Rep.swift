//
//  Rep.swift
//  BribeCongress
//
//  Created by John Bogil on 3/24/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import Foundation

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
    
    init(with dict: [String:String]) {
        bioguideID = dict["bioguide_id"]
        birthday = dict["birthdate"]
        facebook = dict["facebook_id"]
        firstElected = dict["first_elected"]
        fullName = dict["firstlast"]
        gender = dict["gender"]
        office = dict["office"]
        lastName = dict["lastname"]
        party = dict["party"]
        phone = dict["phone"]
        twitter = dict["twitter_id"]
        webform = dict["webform"]
        website = dict["website"]
        youtube = dict["youtube_url"]
    }
    
}
