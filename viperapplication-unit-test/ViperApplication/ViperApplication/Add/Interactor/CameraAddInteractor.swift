//
//  CameraAddInteractor.swift
//  ViperApplication
//
//  Created by iosdev on 4/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraAddInteractor:PresenterToInteractorCameraAddProtocol{
    var cameraStore = CameraDataManager()
    var presenter: InteractorToPresenterCameraAddProtocol?

    func addCamera(camera:CameraItem) {
        cameraStore.addCamera(camera)
        presenter?.addCameraSuccess(camera: camera)
    }
}
