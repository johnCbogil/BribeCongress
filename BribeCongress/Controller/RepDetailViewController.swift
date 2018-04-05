//
//  RepDetailViewController.swift
//  BribeCongress
//
//  Created by John Bogil on 4/5/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class RepDetailViewController: UIViewController {
    
    var rep: Rep! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        print(rep.fullName)
    }
}
