//
//  CameraDetailView.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraDetailView: UIViewController {
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var cameraNameLbl: UILabel!
    @IBOutlet weak var barButtonBack: UIBarButtonItem!
    @IBOutlet weak var barButtonEdit: UIBarButtonItem!
    @IBOutlet weak var barButtonTrash: UIBarButtonItem!
    
    var presenter: ViewToPresenterCameraDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getCameraDetail()
        //      print("วิว 2 ถูกโหลดแล้ว")
    }
    //    override func viewWillAppear(_ animated: Bool) { print("วิว 2 กำลังแสดง") }
    //    override func viewDidAppear(_ animated: Bool) { print("วิว 2 แสดงแล้ว") }
    //    override func viewWillDisappear(_ animated: Bool) { print("วิว 2 กำลังจะหายไป") }
    //    override func viewDidDisappear(_ animated: Bool) { print("วิว 2 หายไปแล้ว") }
    @IBAction func barButtonBackPress(_ sender: Any) {
        presenter?.backButtonPressed()
    }
    
    @IBAction func barButtonEditPress(_ sender: Any) {
        let alertController = UIAlertController(title: "Edit Camera Item", message: "Enter name and price", preferredStyle: .alert)
        alertController.addTextField { $0.text = self.cameraNameLbl.text }
        alertController.addTextField { $0.text = self.priceLbl.text }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self](_) in
            let nameText = alertController.textFields![0].text ?? ""
            let priceText = alertController.textFields![1].text ?? ""
            guard !nameText.isEmpty else { return }
            self?.presenter?.editButtonPressed(name: nameText, price: priceText)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func barButtonTrashPress(_ sender: Any) {
        let alertController = UIAlertController(title: "Delete Camera", message: "Are you want to delete this camera?", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {
            [weak self](_) in
            self?.presenter?.deleteButtonPressed()
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension CameraDetailView:PresenterToViewCameraDetailProtocol{
    func showCameraDetail(camera: CameraItem) {
        cameraImage.image = UIImage(named: camera.name)
        cameraNameLbl.text = camera.name
        priceLbl.text = camera.price
    }
}
