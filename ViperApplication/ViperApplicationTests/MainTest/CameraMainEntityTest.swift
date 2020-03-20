//
//  CameraMainEntityTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 28/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication
class CameraMainEntityTest:XCTestCase{
    var sut:CameraDataManager?
    override func setUp() {
        sut = CameraDataManager()
        super.setUp()
        
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testnotnil(){
        let cameraData = CameraItem(name: "Camera123", price: "5,000")
        XCTAssertNotNil(cameraData)
    }
    func testInitailDataToEntity(){
        let cameraTest = CameraItem(name: "Camera123", price: "5,000")
        XCTAssertEqual(cameraTest.name, "Camera123")
        XCTAssertEqual(cameraTest.price, "5,000")
        XCTAssertEqual(cameraTest, cameraTest)
    }
    
}

