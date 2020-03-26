//
//  CameraDetailRouter.swift
//  ViperApplication
//
//  Created by iosdev on 27/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraDetailRouter: PresenterToRouterCameraDetailProtocol {
    var detailStoryboard: UIStoryboard{
        return UIStoryboard(name:"CameraDetailView",bundle: Bundle.main)
    }
    
    func createDetailModule(camera:CameraItem)-> CameraDetailView {
        let auxNavigationController2 = detailStoryboard.instantiateViewController(withIdentifier: "CameraDetailViewNavigatorController") as! UINavigationController
        
        let view = auxNavigationController2.viewControllers.last as! CameraDetailView
        
        let presenter: ViewToPresenterCameraDetailProtocol & InteractorToPresenterCameraDetailProtocol = CameraDetailPresenter()
        let interactor: PresenterToInteractorCameraDetailProtocol = CameraDetailInteractor()
        let router:PresenterToRouterCameraDetailProtocol = CameraDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.cameraItem = camera
        
        return view
    }
    
    func popToMainModule() {
        if let navigationController2 = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
        navigationController2.popViewController(animated: true)
        }
    }
    
}
