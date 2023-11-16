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

        // 1. Search by image data
//        if let imageData = UIImage(named: "testImage2")?.jpegData(compressionQuality: 1) {
//            VisionAPIManager.shared.webDetection(imageData: imageData)
//        }
        
        // 2. Search by image url
        let imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Taipei_Arena_20230529.jpg/2880px-Taipei_Arena_20230529.jpg"
        VisionAPIManager.shared.webDetection(urlString: imageURL)
    }


}

