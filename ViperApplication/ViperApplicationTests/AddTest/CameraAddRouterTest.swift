//
//  CameraAddRouterTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 28/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication
class CameraAddRouterTest:XCTestCase{
    var sut:CameraAddRouter?
    var nav = UINavigationController()
    override func setUp() {
        sut = CameraAddRouter()
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testinitial(){
        let cameraAddView = sut?.createAddModule().navigationController
        let nc = cameraAddView?.viewControllers.first
        XCTAssertNotNil(nc)
        XCTAssertNotNil((nc as? PresenterToViewCameraAddProtocol)?.presenter)
        XCTAssertNotNil((nc as? PresenterToViewCameraAddProtocol)?.presenter?.interactor)
        XCTAssertTrue(nc is CameraAddView)
        XCTAssertTrue(nc is PresenterToViewCameraAddProtocol)
    }
    
    func testGoBackToCameraMain(){
//        sut?.pushToCameraMain()
//        let nc = nav.viewControllers
//        let nc2 = nc.last
//        XCTAssertNotNil(nc2)
        //        XCTAssertNotNil((nc2 as? CameraAddViewProtocol)?.presenter)
        //        XCTAssertNotNil((nc2 as? CameraAddViewProtocol)?.presenter?.interactor)
        //        XCTAssertTrue(nc2 is CameraAddView)
        //        XCTAssertTrue(nc2 is CameraAddViewProtocol)
        
        
    }
    
}
