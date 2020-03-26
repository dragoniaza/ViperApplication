//
//  CameraDetailProtocol.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit
protocol PresenterToViewCameraDetailProtocol: class {
    var presenter: ViewToPresenterCameraDetailProtocol? {get set}
    //Presenter -> View
    func showCameraDetail(camera: CameraItem)
}

protocol ViewToPresenterCameraDetailProtocol: class {
    var router: PresenterToRouterCameraDetailProtocol? {get set}
    var view: PresenterToViewCameraDetailProtocol? {get set}
    var interactor: PresenterToInteractorCameraDetailProtocol? {get set}
    //View -> Presenter
    func getCameraDetail()
    func backButtonPressed()
    func deleteButtonPressed()
    func editButtonPressed(name:String,price:String)
}

protocol PresenterToRouterCameraDetailProtocol: class {
    func createDetailModule(camera:CameraItem)-> CameraDetailView
    func popToMainModule()
}

protocol PresenterToInteractorCameraDetailProtocol:class {
    var presenter:InteractorToPresenterCameraDetailProtocol? { get set }
    var cameraItem:CameraItem? { get set }
    
    func editCamera(name2:String,price2:String)
    func deleteCamera()
}

protocol InteractorToPresenterCameraDetailProtocol:class{
    func didEditCamera(_ camera:CameraItem)
    func didDeleteCamera(_ camera:CameraItem)
}
