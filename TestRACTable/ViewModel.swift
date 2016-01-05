//
//  ViewModel.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewModel: NSObject {
    
    let service = Service()
    private var data: [Model]?
    
//    dynamic var itemViewModels: [ItemViewModel]?
    
    var itemViewModels = MutableProperty<[ItemViewModel]>([])
    
    func getData() {
//        service.getList().startWithNext{
//            response in
//            self.data = response
//            
////            self.itemViewModels = []
////            for d in self.data! {
////                self.itemViewModels?.append(ItemViewModel(d.name))
////            }
//            
//            var tempItemViewModels: [ItemViewModel] = []
//            for d in self.data! {
//                tempItemViewModels.append(ItemViewModel(d.name))
//            }
//            self.itemViewModels.value = tempItemViewModels
//        }
        
        self.itemViewModels <~ service.getList().map {
            (models: [Model]) -> [ItemViewModel] in
            return models.map {
                ItemViewModel($0.name)
            }
        }
    }

}
