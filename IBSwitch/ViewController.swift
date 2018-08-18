//
//  ViewController.swift
//  IBSwitch
//
//  Created by vladgohn on 8/18/18.
//  Copyright © 2018 vladgohn. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func switchClick(_ sender: IBSwitch) {
        print(sender.isChecked)
    }
    
}

