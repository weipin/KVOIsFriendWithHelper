//
//  App.swift
//  KVOIsFriendWithHelper
//
//  Created by Weipin Xia on 8/23/16.
//  Copyright © 2016 Weipin Xia. All rights reserved.
//

import Foundation

class App {
    class var sharedInstance: App {
        struct Singleton {
            static let sharedInstance = App()
        }

        return Singleton.sharedInstance
    }

    let model = MyModel()
}
