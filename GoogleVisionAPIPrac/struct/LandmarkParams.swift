//
//  WebDetectionParameterStruct.swift
//  GoogleVisionAPIPrac
//
//  Created by 粘光裕 on 2023/11/19.
//

import Foundation

// MARK: - Welcome
struct LandmarkParams: Codable {
    let requests: WebDetectionParameterRequests

    // MARK: - Requests
    struct WebDetectionParameterRequests: Codable {
        let image: WebDetectionParameterImage
        let features: [WebDetectionParameterFeature]
    }

    // MARK: - Feature
    struct WebDetectionParameterFeature: Codable {
        let type: String
        let maxResults: Int
    }

    // MARK: - Image
    struct WebDetectionParameterImage: Codable {
        let source: Source?
        let content: String?
    }

    // MARK: - Source
    struct Source: Codable {
        let imageURI: String?

        enum CodingKeys: String, CodingKey {
            case imageURI = "imageUri"
        }
    }
}
