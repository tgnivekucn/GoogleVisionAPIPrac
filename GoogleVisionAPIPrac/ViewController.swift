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

        // 1. Web detection by image data
        if let imageData = UIImage(named: "testImage3")?.jpegData(compressionQuality: 1) {
            VisionAPIManager.shared.webDetection(imageData: imageData)
        }
        
        // 2. Web detection by image url
//        let imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Taipei_Arena_20230529.jpg/2880px-Taipei_Arena_20230529.jpg"
//        VisionAPIManager.shared.webDetection(urlString: imageURL)
        
        // 3. Landmark detection by image data
//        if let imageData = UIImage(named: "testImage4")?.jpegData(compressionQuality: 1) {
//            VisionAPIManager.shared.landmarkDetection(imageData: imageData)
//        }
    }
}

