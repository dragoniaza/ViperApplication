//
//  VipTesting.swift
//  ViperApplicationTests
//
//  Created by iosdev on 27/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication

class CameraMainPresentorTest: XCTestCase{
    var sut:CameraListPresenter!
    var mockView: MockView!
    var mockInteractor: MockInteractor!
    var mockRouter: MockRouter!
    var navigationController = UINavigationController()
    override func setUp() {
        
        sut = CameraListPresenter()
        mockView = MockView()
        mockInteractor = MockInteractor()
        mockRouter = MockRouter()
        mockInteractor?.presenter = sut
        sut.view = mockView
        sut.router = mockRouter
        sut.interactor = mockInteractor
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }
    
    func testPresenterGetCameraList(){
        sut?.getAllCameraList()
        XCTAssertTrue(mockInteractor.processing)
    }
    
    func testPresenterReloadTableCamera() {
        sut?.getCameraListSuccess(cameraList: [cameraMocking])
        XCTAssertTrue(mockView.isReloadTableCamera)
    }
    
    func testFetchingCamera(){
        sut.startFetchingCamera()
        XCTAssertTrue(mockInteractor.loadCameraSuccess)
    }
    
    func testUserSelectRow(){
        sut.showCameraSelection(navigationController: navigationController, camera: cameraMocking)
        XCTAssertEqual(mockRouter.camera?.name, cameraMocking.name)
    }
    
    func testUserSelectBackButton(){
        sut.pressAddCameraButton(navigationController: navigationController)
        XCTAssertTrue(mockRouter.changeModule)
    }
    
    
}



class MockView:PresenterToViewCameraListProtocol{
    var presenter: ViewToPresenterCameraListProtocol?
    var isReloadTableCamera = false
    func reloadTableCamera(_ cameras: [CameraItem]) {
        isReloadTableCamera = true
    }
}

class MockInteractor:PresenterToInteractorCameraListProtocol{    
    var presenter: InteractorToPresenterCameraListProtocol?
    var output:InteractorToPresenterCameraListProtocol?
    let cStore = CameraDataManager()
    var processing = false
    var loadCameraSuccess = false
    
    func getAllCameraList() {
        processing = true
        
    }
    
    func initialCameraData() {
        loadCameraSuccess = true
    }
    
    
    func getAllCameraDetail() -> [CameraItem] {
        return []
    }

    
}

class MockRouter:PresenterToRouterCameraListProtocol{
    func pushToDetailModule(camera: CameraItem, navigationController: UINavigationController) {
        self.camera = camera

    }
    
    func pushToAddModule(navigationController: UINavigationController) {
        changeModule = true

    }
    
    
    var changeModule = false
    var camera : CameraItem?
    
    func createListModule() -> CameraListView {
        return CameraListView()
    }
    
}
