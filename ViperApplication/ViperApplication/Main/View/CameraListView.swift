//
//  ViewController.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit

class CameraListView: UIViewController {
    
    @IBOutlet weak var CameraTblView: UITableView!
    @IBOutlet weak var addCameraButton: UIBarButtonItem!
    
    var presenter: ViewToPresenterCameraListProtocol?
    var cameras = [CameraItem]()
    
    override func viewDidLoad() {
        presenter?.startFetchingCamera()
        print("วิว 1 ถูกสร้างแล้ว")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getAllCameraList()
        print("วิว 1 กำลังจะแสดง")
    }
    
    //    override func viewDidAppear(_ animated: Bool) {print("วิว 1 แสดงแล้ว")}
    //    override func viewWillDisappear(_ animated: Bool) {print("วิว 1 กำลังจะหายไป")}
    //    override func viewDidDisappear(_ animated: Bool) {print("วิว 1 หายไปแล้ว")}
    
}

extension CameraListView :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let camera = cameras[indexPath.row]
        presenter?.showCameraSelection(navigationController: navigationController!, camera: camera)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cameras.count
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CameraCell", for: indexPath)
        let camera = cameras[indexPath.row]
        cell.textLabel?.text = camera.name
        cell.detailTextLabel?.text = camera.price
        return cell
    }

    @IBAction func addCameraButtonPress(_ sender: Any) {
        presenter?.pressAddCameraButton(navigationController: navigationController!)
    }

}


extension CameraListView: PresenterToViewCameraListProtocol {
    
    func reloadTableCamera(_ cameras: [CameraItem]) {
        self.cameras = cameras
        DispatchQueue.main.async{
        self.CameraTblView.reloadData()
        }
    }
    
}
