//
//  ViewController.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    private var bindingHelper: TableBindingHelper?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reloadDataButton: UIButton!
    @IBOutlet weak var reloadTableButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bindViewModel()
        bindButton()
        viewModel.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        self.bindingHelper = TableBindingHelper(tableView: self.tableView, viewModel: self.viewModel)
    }
    
    func bindButton() {
        
//        doesn't work. Still not clear about Action and CocoaAction
//        and what the best way to define action in VC or VM is
        
        let reloadDataAction = Action<Void, Void, NoError> {
            self.viewModel.getData()
            return SignalProducer.empty
        }
        let reloadDataCocoaAction = CocoaAction(reloadDataAction, input: ())
//            {
//            _ in
//            self.viewModel.getData()
//            print("aaa")
//        }
        
        reloadDataButton.addTarget(reloadDataCocoaAction, action: CocoaAction.selector, forControlEvents: .TouchUpInside)
        
        
        // Old way using RACSignal
//        reloadDataButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {
//            _ in
//            self.viewModel.getData()
//        }
        
        reloadTableButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {
            _ in
            self.tableView.reloadData()
        }
    }
    
    @IBAction func reloadData() {
        self.viewModel.getData()
    }

}

