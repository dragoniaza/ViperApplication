//
//  ViperEntity.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import Foundation


class CameraItem {
    var name:String
    var price:String
    
    init(name : String,price : String) {
        self.name = name
        self.price = price
    }
}

extension CameraItem: Equatable {
    static func ==(lhs: CameraItem, rhs: CameraItem) -> Bool {
        return lhs.name == rhs.name &&
            lhs.price == rhs.price 
    }
}
