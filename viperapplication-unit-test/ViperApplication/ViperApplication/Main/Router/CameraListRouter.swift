//
//  ViperRouter.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraListRouter: PresenterToRouterCameraListProtocol {
    
    var cameraDetailRouter = CameraDetailRouter()
    var cameraAddRouter = CameraAddRouter()
    
    var mainStoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func createListModule()-> CameraListView {
        
            let auxNavigationController = mainStoryboard.instantiateViewController(withIdentifier: "CameraMainViewNavigationController") as! UINavigationController
        
            let view = auxNavigationController.viewControllers.first as! CameraListView
            
            let presenter: ViewToPresenterCameraListProtocol & InteractorToPresenterCameraListProtocol = CameraListPresenter()
            let interactor: PresenterToInteractorCameraListProtocol = CameraListInteractor()
            let router:PresenterToRouterCameraListProtocol = CameraListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
        
            return view
            
    }
    
    func pushToDetailModule(camera:CameraItem,navigationController:UINavigationController) {
        let detailModule = cameraDetailRouter.createDetailModule(camera: camera)
        navigationController.pushViewController(detailModule, animated: true)
    }
    
    func pushToAddModule(navigationController:UINavigationController) {
        let addModule = cameraAddRouter.createAddModule()
        navigationController.pushViewController(addModule, animated: true)
    }
    
    
}
