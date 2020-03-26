//
//  common.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit
import CoreData

class CameraDataManager {
    
    public static var cameras = [CameraItem]()
    
    func initialCameraData() {
        CameraDataManager.cameras = [
            CameraItem(name:"nikon D5300",price:"15,000"),
            CameraItem(name:"nikon Z6",price:"50,000"),
            CameraItem(name:"canon 760D",price:"18,000"),
            CameraItem(name:"canon EOS R",price:"55,000")
        ]
    }
    
    func getAllCameraList() ->  [CameraItem] {
        return CameraDataManager.cameras
    }
    
    func clearData() {
        CameraDataManager.cameras.removeAll()
    }
    
    func addCamera(_ camera: CameraItem) {
        CameraDataManager.cameras.append(camera)
    }
    
    func removeCamera(_ camera: CameraItem) {
        if let index = CameraDataManager.cameras.firstIndex(where: {$0 === camera}) {
            CameraDataManager.cameras.remove(at: index)
        }
    }
    
    
}
