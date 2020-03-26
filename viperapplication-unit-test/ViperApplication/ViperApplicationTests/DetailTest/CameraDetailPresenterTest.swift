//
//  cameraDetailPresenterTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 30/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication

class CameraDetailPresenterTest: XCTestCase {
    
    var sut:CameraDetailPresenter?
    var mockViewDetail: MockViewDetail?
    var mockRouterDetail: MockRouterDetail?
    var mockInteractorDetail:MockInteractorDetail?
    let mockCamera = cameraMocking
    override func setUp() {
        sut = CameraDetailPresenter()
        mockViewDetail = MockViewDetail()
        mockRouterDetail = MockRouterDetail()
        mockInteractorDetail = MockInteractorDetail()
        sut?.view = mockViewDetail
        sut?.router = mockRouterDetail
        sut?.interactor = mockInteractorDetail
        sut?.interactor?.cameraItem = mockCamera
        
        
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockViewDetail = nil
        mockRouterDetail = nil
        super.tearDown()
    }
    
    func testEditCameraData(){
        sut?.editButtonPressed(name: cameraMocking.name, price: cameraMocking.price)
        sut?.didEditCamera(cameraMocking)
        XCTAssertNotNil(mockInteractorDetail?.cameraItem)
        XCTAssertTrue(mockInteractorDetail?.changeData ?? false)
    }
    
    func testPresenterSendDetailsToView() {
        XCTAssertNotNil(mockViewDetail?.showCameraDetail(camera: mockCamera))
        XCTAssertTrue(mockViewDetail?.showDetail ?? false)
    }
    
    func testDeleteCameraData(){
        sut?.deleteButtonPressed()
        sut?.didDeleteCamera(cameraMocking)
        XCTAssertNotNil(mockInteractorDetail?.cameraItem)
        XCTAssertTrue(mockInteractorDetail?.changeData ?? false)
    }
    
}

class MockViewDetail:PresenterToViewCameraDetailProtocol{
    var presenter: ViewToPresenterCameraDetailProtocol?
    var showDetail = false
    var backbutton = false
    func showCameraDetail(camera: CameraItem) {
        showDetail = true
    }
    func backButtonPress(){
        backbutton = true
    }
    
}

class MockRouterDetail:PresenterToRouterCameraDetailProtocol{
    
    var backToCameraList = false
    
    func goBackToCameraListView(fromView caller: AnyObject) {
        backToCameraList = true
    }
    
    func popToMainModule() {
        
    }
    
    func createDetailModule(camera: CameraItem) -> CameraDetailView {
        return CameraDetailView()
    }

}

class MockInteractorDetail:PresenterToInteractorCameraDetailProtocol {
    
    weak var presenter: InteractorToPresenterCameraDetailProtocol?
    var cameraItem: CameraItem?
    var changeData = false
    
    func editCamera(name2: String, price2: String) {
        changeData = true
    }
    
    func deleteCamera()  {
        changeData = true
    }
}
