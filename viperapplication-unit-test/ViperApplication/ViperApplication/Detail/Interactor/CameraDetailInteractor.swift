//
//  CameraDetailInteractor.swift
//  ViperApplication
//
//  Created by iosdev on 19/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import Foundation

class CameraDetailInteractor:PresenterToInteractorCameraDetailProtocol{
    weak var presenter: InteractorToPresenterCameraDetailProtocol?
    var cameraItem: CameraItem?
    var cameraDataManager = CameraDataManager()
    
    func editCamera(name2: String, price2: String) {
        guard let cameraItem = cameraItem else {
            return
        }
        cameraItem.name = name2
        cameraItem.price = price2
        presenter?.didEditCamera(cameraItem)
    }
    
    func deleteCamera() {
        guard let cameraItem = cameraItem else {
            return
        }
        cameraDataManager.removeCamera(cameraItem)
        presenter?.didDeleteCamera(cameraItem)
    }
}
