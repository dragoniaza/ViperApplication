//
//  ViperPresenter.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.


import UIKit
class CameraListPresenter: ViewToPresenterCameraListProtocol {
    var interactor: PresenterToInteractorCameraListProtocol?
    var view: PresenterToViewCameraListProtocol?
    var router: PresenterToRouterCameraListProtocol?
    
    func showCameraSelection(navigationController: UINavigationController,camera: CameraItem) {
        router?.pushToDetailModule(camera: camera, navigationController: navigationController)
    }
    
    func startFetchingCamera() {
        interactor?.initialCameraData()
    }
    
    func getAllCameraList(){
        interactor?.getAllCameraList()
    }
    
    func pressAddCameraButton(navigationController:UINavigationController) {
        router?.pushToAddModule(navigationController:navigationController)
    }
}
extension CameraListPresenter:InteractorToPresenterCameraListProtocol{
    
    func getCameraListSuccess(cameraList: [CameraItem]) {
        view?.reloadTableCamera(cameraList)
    }
    
    
}
