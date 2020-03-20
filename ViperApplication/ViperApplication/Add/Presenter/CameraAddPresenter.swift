//
//  CameraAddPresenter.swift
//  ViperApplication
//
//  Created by iosdev on 4/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraAddPresenter:ViewToPresenterCameraAddProtocol,InteractorToPresenterCameraAddProtocol{
    
    var view: PresenterToViewCameraAddProtocol?
    var interactor: PresenterToInteractorCameraAddProtocol?
    var router: PresenterToRouterCameraAddProtocol?
    var camera:CameraItem?
    
    func pressDoneButton(camera : CameraItem) {
        interactor?.addCamera(camera: camera)
    }
    
    func pressCancleButton() {
       router?.pushToMainModule()
    }

    func addCameraSuccess(camera : CameraItem){
        router?.pushToMainModule()
    }
    
    
}
