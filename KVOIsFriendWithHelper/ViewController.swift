//
//  ViewController.swift
//  KVOIsFriendWithHelper
//
//  Created by Weipin Xia on 8/23/16.
//  Copyright © 2016 Weipin Xia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func trigger(sender: AnyObject) {
        App.sharedInstance.model.foo1 = 2.0
        App.sharedInstance.model.foo2 = 2.0
    }
}

