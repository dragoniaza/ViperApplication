//
//  CameraAddView.swift
//  ViperApplication
//
//  Created by iosdev on 4/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraAddView: UIViewController {
    var presenter: ViewToPresenterCameraAddProtocol?
    
    
    @IBOutlet weak var barButtonCancle: UIBarButtonItem!
    @IBOutlet weak var barButtonDone: UIBarButtonItem!
    @IBOutlet weak var cameraNameTextField: UITextField!
    @IBOutlet weak var cameraPriceTextField: UITextField!
    
    @IBAction func pressDoneButton(_ sender: UIBarButtonItem) {
        let cameraname = cameraNameTextField.text
        let cameraPrice = cameraPriceTextField.text
        let cameraItem = CameraItem(name: cameraname!, price: cameraPrice!)
        presenter?.pressDoneButton(camera: cameraItem)
    }
    
    @IBAction func pressCancleButton(_ sender: UIBarButtonItem) {
        presenter?.pressCancleButton()
    }
    
    
    override func viewDidLoad() {
    }
}

extension CameraAddView : PresenterToViewCameraAddProtocol {
    
}

