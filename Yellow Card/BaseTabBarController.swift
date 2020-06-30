//
//  BaseTabBarController.swift
//  Yellow Card
//
//  Created by Paul Barnes on 30/06/2020.
//  Copyright © 2020 Paul Barnes. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectedIndex = defaultIndex
    }
}
