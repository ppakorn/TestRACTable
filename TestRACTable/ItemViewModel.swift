//
//  ItemViewModel.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ItemViewModel: NSObject {
    
//    dynamic var name: String?
    var name = MutableProperty<String?>(nil)
    
    init(_ name: String) {
        self.name.value = name
    }
    
}
