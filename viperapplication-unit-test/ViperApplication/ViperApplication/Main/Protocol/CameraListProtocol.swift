//
//  ViperProtocol.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit
import Foundation

protocol PresenterToViewCameraListProtocol: class {
    var presenter: ViewToPresenterCameraListProtocol? { get set }
    func reloadTableCamera(_ cameras:[CameraItem])
}

protocol PresenterToInteractorCameraListProtocol: class {
    var presenter:InteractorToPresenterCameraListProtocol? { get set }
    func initialCameraData()
    func getAllCameraList()
}

protocol InteractorToPresenterCameraListProtocol: class{
    func getCameraListSuccess(cameraList: [CameraItem])
}

protocol ViewToPresenterCameraListProtocol: class {
    var interactor: PresenterToInteractorCameraListProtocol? { get set }
    var view: PresenterToViewCameraListProtocol? { get set }
    var router: PresenterToRouterCameraListProtocol? { get set }
  
    func startFetchingCamera()
    func showCameraSelection(navigationController: UINavigationController,camera: CameraItem)
    func pressAddCameraButton(navigationController:UINavigationController)
    func getAllCameraList()
}

protocol PresenterToRouterCameraListProtocol: class {
    func pushToDetailModule(camera:CameraItem,navigationController:UINavigationController)
    func pushToAddModule(navigationController:UINavigationController)
    func createListModule()-> CameraListView
}
