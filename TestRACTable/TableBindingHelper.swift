//
//  TableBindingHelper.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit
import ReactiveCocoa

class TableBindingHelper: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel: ViewModel
    var tableView: UITableView
    
    init(tableView: UITableView, viewModel: ViewModel) {
        self.viewModel = viewModel
        self.tableView = tableView
        
        super.init()
        
        viewModel.itemViewModels.producer.startWithNext {
            _ in
            tableView.reloadData()
        }
    
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemViewModels.value.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! NormalTableViewCell
        cell.bindViewModel(viewModel.itemViewModels.value[indexPath.row])
        return cell
    }
}