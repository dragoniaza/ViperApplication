//
//  CameraDetailRouterTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 28/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication
class CameraDetailRouterTest:XCTestCase{
    var sut : CameraDetailRouter?
    var navi = UINavigationController()
    override func setUp() {
        sut = CameraDetailRouter()
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCreateDetailModule() {
        navi = (sut?.createDetailModule(camera: cameraMocking).navigationController)!
        let vc = navi.viewControllers.first
        XCTAssertNotNil(vc)
        XCTAssertNotNil((vc as? PresenterToViewCameraDetailProtocol)?.presenter)
        XCTAssertNotNil((vc as? PresenterToViewCameraDetailProtocol)?.presenter?.interactor)
        XCTAssertTrue(vc is CameraDetailView)
        XCTAssertTrue(vc is PresenterToViewCameraDetailProtocol)
    }
    
    func testPopToListModule(){
        navi = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)! 
        navi = (sut?.createDetailModule(camera: cameraMocking).navigationController)!
        sut?.popToMainModule()
        XCTAssertTrue(navi.viewControllers.first is CameraDetailView)

    }
}
