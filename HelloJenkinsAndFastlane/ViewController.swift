//
//  ViewController.swift
//  HelloJenkinsAndFastlane
//
//  Created by Виктория Бадисова on 29/01/2020.
//  Copyright © 2020 Виктория Бадисова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        label.text = "TEST Hello, Jenkins and Fastlane!"
        label.textAlignment = .center
        label.accessibilityIdentifier = "Hello"
        self.view.addSubview(label)
    }


}

