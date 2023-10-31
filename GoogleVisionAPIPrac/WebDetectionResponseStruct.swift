//
//  WebDetectionResponseStruct.swift
//  GoogleVisionAPIPrac
//
//  Created by 粘光裕 on 2023/11/1.
//

import Foundation
// MARK: - WebDetectionResponseStruct
struct WebDetectionResponseStruct: Codable {
    let responses: [Response]
}

// MARK: - Response
struct Response: Codable {
    let webDetection: WebDetection
}

// MARK: - WebDetection
struct WebDetection: Codable {
    let webEntities: [WebEntity]
    let fullMatchingImages, partialMatchingImages: [Image]
    let pagesWithMatchingImages: [PagesWithMatchingImage]
    let visuallySimilarImages: [Image]
    let bestGuessLabels: [BestGuessLabel]
}

// MARK: - BestGuessLabel
struct BestGuessLabel: Codable {
    let label: String
}

// MARK: - Image
struct Image: Codable {
    let url: String
}

// MARK: - PagesWithMatchingImage
struct PagesWithMatchingImage: Codable {
    let url: String
    let pageTitle: String
    let fullMatchingImages: [Image]
}

// MARK: - WebEntity
struct WebEntity: Codable {
    let entityID: String
    let score: Double
    let description: String

    enum CodingKeys: String, CodingKey {
        case entityID = "entityId"
        case score, description
    }
}
