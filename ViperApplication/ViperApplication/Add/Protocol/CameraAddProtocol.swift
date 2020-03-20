//
//  CameraAddProtocol.swift
//  ViperApplication
//
//  Created by iosdev on 4/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

protocol PresenterToViewCameraAddProtocol:class {
    var presenter: ViewToPresenterCameraAddProtocol? { get set }
}

protocol ViewToPresenterCameraAddProtocol:class {
    var view:PresenterToViewCameraAddProtocol? { get set }
    var interactor:PresenterToInteractorCameraAddProtocol? { get set }
    var router:PresenterToRouterCameraAddProtocol? { get set }
    
    func pressDoneButton(camera : CameraItem)
    func pressCancleButton()
}

protocol PresenterToInteractorCameraAddProtocol:class {
    var presenter:InteractorToPresenterCameraAddProtocol? { get set }
    
    func addCamera(camera : CameraItem)
}

protocol InteractorToPresenterCameraAddProtocol:class {
    
    func addCameraSuccess(camera : CameraItem)
}

protocol PresenterToRouterCameraAddProtocol:class {
    
    func createAddModule()-> CameraAddView
    func pushToMainModule()
}
