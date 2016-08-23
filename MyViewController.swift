//
//  MyViewController.swift
//  KVOIsFriendWithHelper
//
//  Created by Weipin Xia on 8/23/16.
//  Copyright © 2016 Weipin Xia. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var slider1: UISlider!

    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var slider2: UISlider!

    deinit {
        // perform the deinitialization
        let KVOCenter = KeyValueObservingCenter.defaultCenter()
        KVOCenter.removeObserverForContextObject(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let KVOCenter = KeyValueObservingCenter.defaultCenter()
        KVOCenter.addObserverForKeyPath("foo1", object: App.sharedInstance.model, contextObject:self) {
            [unowned self] keyPath, observed, change, contextObject in
            guard let value = change?[NSKeyValueChangeNewKey] as? Float else {
                return
            }
            self.textField1.text = String(value)
            self.slider1.value = value
        }
        KVOCenter.addObserverForKeyPath("foo2", object: App.sharedInstance.model, contextObject:self) {
            [unowned self] keyPath, observed, change, contextObject in
            guard let value = change?[NSKeyValueChangeNewKey] as? Float else {
                return
            }
            self.textField2.text = String(value)
            self.slider2.value = value
        }

        let m = App.sharedInstance.model
        self.textField1.text = String(m.foo1)
        self.slider1.value = Float(m.foo1)
        self.textField2.text = String(m.foo2)
        self.slider2.value = Float(m.foo2)
    }

    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func field1DidChange(sender: AnyObject) {
        if let value = Double(self.textField1.text!) {
            App.sharedInstance.model.foo1 = value
        } else {
            App.sharedInstance.model.foo1 = 0.0
        }
    }

    @IBAction func field2DidChange(sender: AnyObject) {
        if let value = Double(self.textField2.text!) {
            App.sharedInstance.model.foo2 = value
        } else {
            App.sharedInstance.model.foo2 = 0.0
        }
    }

    @IBAction func slider1DidChange(sender: AnyObject) {
        App.sharedInstance.model.foo1 = Double(self.slider1.value)
    }

    @IBAction func slider2DidChange(sender: AnyObject) {
        App.sharedInstance.model.foo2 = Double(self.slider2.value)
    }

}