//
//  NormalTableViewCell.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {
    
    func bindViewModel(itemViewModel: ItemViewModel) {
        RACObserve(itemViewModel, "name").subscribeNext {
            (name: AnyObject!) -> () in
            self.textLabel?.text = name as? String
        }
    }

}
