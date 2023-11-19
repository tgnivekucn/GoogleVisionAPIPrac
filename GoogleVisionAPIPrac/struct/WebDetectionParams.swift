//
//  WebDetectionParams.swift
//  GoogleVisionAPIPrac
//
//  Created by 粘光裕 on 2023/11/19.
//

import Foundation

struct WebDetectionParams: Codable {
    struct Request: Codable {
        struct Feature: Codable {
            let type: String
        }

        struct Image: Codable {
            struct Source: Codable {
                let imageUri: String
            }
            let source: Source?
            let content: String?

        }

        struct ImageContext: Codable {
            struct WebDetectionParams: Codable {
                let includeGeoResults: Bool
            }
            let webDetectionParams: WebDetectionParams
        }
        
        let features: [Feature]
        let image: Image
        let imageContext: ImageContext
    }
    
    let requests: [Request]
}
