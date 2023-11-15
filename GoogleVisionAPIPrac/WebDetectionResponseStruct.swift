//
//  WebDetectionResponseStruct.swift
//  GoogleVisionAPIPrac
//
//  Created by 粘光裕 on 2023/11/1.
//

import Foundation

// MARK: - WebDetectionResponseStruct
struct WebDetectionResponseStruct: Codable {
    let responses: [Response]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        responses = try container.decodeIfPresent([Response].self, forKey: .responses)
    }
}

// MARK: - Response
struct Response: Codable {
    let webDetection: WebDetection?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        webDetection = try container.decodeIfPresent(WebDetection.self, forKey: .webDetection)
    }
}

// MARK: - WebDetection
struct WebDetection: Codable {
    let webEntities: [WebEntity]?
    let fullMatchingImages, partialMatchingImages: [Image]?
    let pagesWithMatchingImages: [PagesWithMatchingImage]?
    let visuallySimilarImages: [Image]?
    let bestGuessLabels: [BestGuessLabel]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        webEntities = try container.decodeIfPresent([WebEntity].self, forKey: .webEntities)
        fullMatchingImages = try container.decodeIfPresent([Image].self, forKey: .fullMatchingImages)
        partialMatchingImages = try container.decodeIfPresent([Image].self, forKey: .partialMatchingImages)
        pagesWithMatchingImages = try container.decodeIfPresent([PagesWithMatchingImage].self, forKey: .pagesWithMatchingImages)
        visuallySimilarImages = try container.decodeIfPresent([Image].self, forKey: .visuallySimilarImages)
        bestGuessLabels = try container.decodeIfPresent([BestGuessLabel].self, forKey: .bestGuessLabels)
    }
}

// MARK: - BestGuessLabel
struct BestGuessLabel: Codable {
    let label: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        label = try container.decodeIfPresent(String.self, forKey: .label)
    }
}

// MARK: - Image
struct Image: Codable {
    let url: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}

// MARK: - PagesWithMatchingImage
struct PagesWithMatchingImage: Codable {
    let url: String?
    let pageTitle: String?
    let fullMatchingImages, partialMatchingImages: [Image]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        pageTitle = try container.decodeIfPresent(String.self, forKey: .pageTitle)
        fullMatchingImages = try container.decodeIfPresent([Image].self, forKey: .fullMatchingImages)
        partialMatchingImages = try container.decodeIfPresent([Image].self, forKey: .partialMatchingImages)
    }
}

// MARK: - WebEntity
struct WebEntity: Codable {
    let entityID: String?
    let score: Double?
    let webEntityDescription: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        entityID = try container.decodeIfPresent(String.self, forKey: .entityID)
        score = try container.decodeIfPresent(Double.self, forKey: .score)
        webEntityDescription = try container.decodeIfPresent(String.self, forKey: .webEntityDescription)
    }
}
