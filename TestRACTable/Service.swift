//
//  Service.swift
//  TestRACTable
//
//  Created by Pakorn Techaveerapong on 11/27/2558 BE.
//  Copyright © 2558 Pakorn Techaveerapong. All rights reserved.
//

import UIKit

class Service: NSObject {

//    func getList() -> SignalProducer<[Model]?, NSError> {
//        return SignalProducer {
//            observer, disposable in
//            let delay = UInt64(2.0) * NSEC_PER_SEC
//            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
//            dispatch_after(delayTime, dispatch_get_main_queue(), {
//                let models = self.buildRandomArrayOfModel()
//                observer.sendNext(models)
//                observer.sendCompleted()
//            })
//        }
//    }
    
    func getList(completeBlock: ([Model]? -> Void)) {
        let data = buildRandomArrayOfModel()
        completeBlock(data)
    }
    
    func buildRandomArrayOfModel() -> Array<Model> {
        var array: Array<Model> = []
        for i in 1...30 {
            array.append(Model("Name \(i)"))
        }
        
        return array
    }
    
}
