//
//  ViewController.swift
//  GoogleVisionAPIPrac
//
//  Created by 粘光裕 on 2023/11/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let imageData = UIImage(named: "testImage2")?.jpegData(compressionQuality: 1) {
            VisionAPIManager.shared.webDetection(imageData: imageData)
        }
    }


}

