//
//  cameraDetailInteractorTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 21/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication
class CameraDetailInteractorTest:XCTestCase{
    
    var sut:CameraDetailInteractor!
    var mockInteractorOutput:MockCameraDetailInteractorOutput!
    var mockStore = CameraDataManager()
    
    override func setUp() {
        sut = CameraDetailInteractor()
        mockInteractorOutput = MockCameraDetailInteractorOutput()
        sut.presenter = mockInteractorOutput
        sut.cameraItem = cameraMocking
        sut.cameraDataManager = mockStore
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockInteractorOutput = nil
        sut?.cameraItem = cameraMocking
        super.tearDown()
    }
    
    func testEditcameraLogic(){
        
        //Check camera data before change
        XCTAssertFalse(mockInteractorOutput.isEditCamera)
        XCTAssertEqual(cameraMocking.name, "Fuji X-A10")
        XCTAssertEqual(cameraMocking.price, "10,000")
        
        sut?.editCamera(name2: "MINOLTA" ,price2: "9,000")
        //Check camera data after change
        XCTAssertEqual(cameraMocking.name, "MINOLTA")
        XCTAssertEqual(cameraMocking.price,"9,000")
        
        sut?.presenter?.didEditCamera(cameraMocking)
        XCTAssertTrue(mockInteractorOutput.isEditCamera)
    }
    
    func testDeleteCameraLogic() {
        mockStore.clearData()
        XCTAssertEqual(mockStore.getAllCameraList().count, 0)
        
        mockStore.addCamera(cameraMocking)
        XCTAssertFalse(mockStore.getAllCameraList()[0].name.isEmpty)
        XCTAssertEqual(mockStore.getAllCameraList().count, 1)
        
        sut?.deleteCamera()
        XCTAssertTrue(mockInteractorOutput?.isDeleteCamera ?? false)
        XCTAssertTrue(mockStore.getAllCameraList().count == 0)
    }
}

class MockCameraDetailInteractorOutput:InteractorToPresenterCameraDetailProtocol {
    
    var isDeleteCamera = false
    var isEditCamera = false
    
    
    func didEditCamera(_ camera: CameraItem) {
        isEditCamera = true
    }
    
    func didDeleteCamera(_ camera: CameraItem) {
        isDeleteCamera = true
        print("Camera store have camera is", CameraDataManager().getAllCameraList().count)
    }
}


