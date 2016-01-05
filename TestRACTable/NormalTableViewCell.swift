//
//  NormalTableViewCell.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit
import ReactiveCocoa

class NormalTableViewCell: UITableViewCell {
    
    func bindViewModel(itemViewModel: ItemViewModel) {
        
        itemViewModel.name.producer.startWithNext {
            nameString in
            self.textLabel?.text = nameString
        }
    }

}
