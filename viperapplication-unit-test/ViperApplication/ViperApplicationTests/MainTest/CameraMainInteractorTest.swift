//
//  CameraMainInteractorTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 27/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication

class CameraMainInterActorTest:XCTestCase{
    var sut:CameraListInteractor!
    var mockInteractorOutput:MockCameraMainOutputInteractorProtocol?
    var mockCameraDataManager:MockCameraDataManager!
    override func setUp() {
        sut = CameraListInteractor()
        mockInteractorOutput = MockCameraMainOutputInteractorProtocol()
        sut.presenter = mockInteractorOutput
        mockCameraDataManager = MockCameraDataManager()
        sut.cameraDataManager = mockCameraDataManager
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockInteractorOutput = nil
        super.tearDown()
    }
    
    func testInteractorPushOutputToPresenter(){
        sut?.initialCameraData()
        XCTAssertTrue(mockCameraDataManager.process)
    }
    
    func testInitailCameraDataFromDataManager(){
        mockCameraDataManager?.camera = StubCameraListResult.camera
        sut.getAllCameraList()
        guard let camera = sut.camera else {
            return
        }
        XCTAssertEqual(camera, StubCameraListResult.camera)
        XCTAssertTrue(mockInteractorOutput?.isSuccess ?? false)
    }
    
    
}

class MockCameraMainOutputInteractorProtocol: InteractorToPresenterCameraListProtocol{
    var isSuccess = false
    func getCameraListSuccess(cameraList: [CameraItem]) {
        isSuccess = true
    }
}


class MockCameraDataManager:CameraDataManager{
    var camera: [CameraItem]?
    var process = false
    override func initialCameraData() {
//        camera = StubCameraListResult.camera
        process = true
    }
    
    override func getAllCameraList() -> [CameraItem] {
        guard let camera = camera else {
            return StubCameraListResult.camera
        }
        return camera
        
    }
}

struct StubCameraListResult {
    static let camera = [CameraItem(name:"abc", price:"1,000"),
                        CameraItem(name:"zzz", price:"2,000"),
                        CameraItem(name:"xyz", price:"3,000")]
}



