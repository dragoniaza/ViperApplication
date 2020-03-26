//
//  CameraDetailPresenter.swift
//  ViperApplication
//
//  Created by iosdev on 27/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraDetailPresenter: ViewToPresenterCameraDetailProtocol{
    weak var view: PresenterToViewCameraDetailProtocol?
    var router: PresenterToRouterCameraDetailProtocol?
    var interactor: PresenterToInteractorCameraDetailProtocol?
    
    func getCameraDetail(){
        if let cameraItem = interactor?.cameraItem {
            view?.showCameraDetail(camera: cameraItem)
        }
    }
    
    func backButtonPressed() {
        router?.popToMainModule()
    }
    
    func editButtonPressed(name: String, price: String) {
        interactor?.editCamera(name2: name, price2: price)
    }
    
    func deleteButtonPressed() {
        interactor?.deleteCamera()
    }
    
}

extension CameraDetailPresenter:InteractorToPresenterCameraDetailProtocol{
    func didDeleteCamera(_ camera: CameraItem) {
            router?.popToMainModule()
    }
    func didEditCamera(_ camera: CameraItem) {
        view?.showCameraDetail(camera: camera)
    }
}

