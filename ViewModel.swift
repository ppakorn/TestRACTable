//
//  ViewModel.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    let service = Service()
    var data: [Model]?
    
    func getData() {
        service.getList().startWithNext{
            response in
            self.data = response
        }
    }

}
