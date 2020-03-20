//
//  CameraAddInteractorTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 18/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication
class CameraAddInteractorTest:XCTestCase{
    var sut:CameraAddInteractor?
    var mockInteractorOutput:MockAddOutputInteractor?
    
    override func setUp() {
        sut = CameraAddInteractor()
        mockInteractorOutput = MockAddOutputInteractor()
        sut?.presenter = mockInteractorOutput
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockInteractorOutput = nil
        
        super.tearDown()
    }
    
    func testAddNewCamera(){
        let cameraStore = CameraDataManager()
        cameraStore.clearData()
        sut?.addCamera(camera: cameraMocking)
        XCTAssertTrue(sut?.cameraStore.getAllCameraList().count == 1)
        XCTAssertTrue(mockInteractorOutput?.newCamera ?? false)
    }
    
    
}

class MockAddOutputInteractor:InteractorToPresenterCameraAddProtocol{
    var newCamera = false
    func addCameraSuccess(camera: CameraItem){
        newCamera = true
    }
    
    
}
