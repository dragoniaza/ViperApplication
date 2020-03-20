//
//  CameraMainRouterTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 5/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication

class CameraMainRouterTest:XCTestCase {
    
    var sut:CameraListRouter?
    var navigationController:UINavigationController!
    var cameraDetailRouter:CameraDetailRouter!
    override func setUp() {
        sut = CameraListRouter()
        navigationController = UINavigationController()
        cameraDetailRouter = CameraDetailRouter()
        sut?.cameraDetailRouter = cameraDetailRouter
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitialization() {
        let cameraListView = (sut?.createListModule().navigationController!.viewControllers)!
        let vc = cameraListView.first
        XCTAssertNotNil(vc)
        XCTAssertNotNil((vc as? PresenterToViewCameraListProtocol)?.presenter)
        XCTAssertNotNil((vc as? PresenterToViewCameraListProtocol)?.presenter?.interactor)
        XCTAssertTrue(vc is CameraListView)
        XCTAssertTrue(vc is PresenterToViewCameraListProtocol)
        
        }
    
    func testPushToDetailModule(){
        sut?.pushToDetailModule(camera: cameraMocking, navigationController: navigationController)
        XCTAssertTrue(navigationController.viewControllers.last is CameraDetailView)
        XCTAssertFalse(navigationController.viewControllers.last is CameraListView)
    }
    
    func testPushToAddModule(){
        sut?.pushToAddModule(navigationController: navigationController)
        XCTAssertTrue(navigationController.viewControllers.last is CameraAddView)
        XCTAssertFalse(navigationController.viewControllers.last is CameraListView)

    }
}
