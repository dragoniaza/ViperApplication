//
//  CameraAddPresenterTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 18/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication
class CameraAddpresenterTest:XCTestCase{
    var sut:CameraAddPresenter?
    var mockView:MockAddView?
    var mockInteractor:MockAddInteractor?
    var mockRouter:MockAddRouter?
    override func setUp() {
        sut = CameraAddPresenter()
        mockView = MockAddView()
        mockInteractor = MockAddInteractor()
        mockInteractor?.presenter = sut
        mockRouter = MockAddRouter()
        sut?.view = mockView
        sut?.interactor = mockInteractor
        
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    func testPressingDoneToFinishAddNewCamera(){
        sut?.pressDoneButton(camera: cameraMocking)
        XCTAssertTrue(mockInteractor?.newCameraDidAdding ?? false)
    }
    
    func testDoneAddingNewCamera(){
        sut?.addCameraSuccess(camera: cameraMocking)
        XCTAssertNotNil(sut?.addCameraSuccess(camera: cameraMocking))
    }
}

class MockAddView:PresenterToViewCameraAddProtocol{
    var presenter: ViewToPresenterCameraAddProtocol?
}

class MockAddInteractor:PresenterToInteractorCameraAddProtocol{
    var presenter: InteractorToPresenterCameraAddProtocol?
    var newCameraDidAdding = false
    func addCamera(camera: CameraItem) {
        newCameraDidAdding = true
    }
    
}

class MockAddRouter:PresenterToRouterCameraAddProtocol{    
    func createAddModule() -> CameraAddView {
        return CameraAddView()
    }
    
    
    func pushToMainModule() {
        
    }
    
    func dismiss(completion: (() -> Void)?) {
        
    }
    
    
}
