//
//  CameraAddRouter.swift
//  ViperApplication
//
//  Created by iosdev on 4/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraAddRouter:PresenterToRouterCameraAddProtocol{
    
    var addModuleStoryboard: UIStoryboard{
        return UIStoryboard(name:"CameraAddView",bundle: Bundle.main)
    }

    func createAddModule()-> CameraAddView {
        let auxNavigationController3 = addModuleStoryboard.instantiateViewController(withIdentifier: "CameraAddViewNavigator") as! UINavigationController
        
        let view = auxNavigationController3.viewControllers.last as! CameraAddView
        
        let presenter: ViewToPresenterCameraAddProtocol & InteractorToPresenterCameraAddProtocol = CameraAddPresenter()
        let interactor: PresenterToInteractorCameraAddProtocol = CameraAddInteractor()
        let router:PresenterToRouterCameraAddProtocol = CameraAddRouter()
        
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    
    func pushToMainModule() {
        if let navigationController2 = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController2.popViewController(animated: true)
        }
    }
    
    
}
