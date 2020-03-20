//
//  AppDelegate.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var cameraMainRouter = CameraListRouter()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /* Create ui-view-controller instance*/
        let cameraMain = cameraMainRouter.createListModule()
        
        /* Initiating instance of ui-navigation-controller with view-controller */
        let navigationController = UINavigationController()
        navigationController.viewControllers = [cameraMain]
        
        /* Setting up the root view-controller as ui-navigation-controller */
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
//    func applicationWillResignActive(_ application: UIApplication) {
//    }
//    
//    func applicationDidEnterBackground(_ application: UIApplication) {
//    }
//    
//    func applicationWillEnterForeground(_ application: UIApplication) {
//    }
//    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//    }
//    
//    func applicationWillTerminate(_ application: UIApplication) {
//    }
    
}
