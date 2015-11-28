//
//  ViewController.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let viewModel = ViewModel()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bindViewModel()
        viewModel.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        RACObserve(viewModel, "data").subscribeNext{ _ in
            self.tableView.reloadData()
        }
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if let name = viewModel.data?[indexPath.row].name {
            cell?.textLabel?.text = name
        }
        return cell!
    }
    
    @IBAction func reloadData() {
        viewModel.loadData()
    }
    
    @IBAction func reloadTable() {
        tableView.reloadData()
    }

}

