//
//  LandmarkDetectionResponseStruct.swift
//  GoogleVisionAPIPrac
//
//  Created by 粘光裕 on 2023/11/19.
//

import Foundation

// MARK: - Welcome
struct LandmarkDetectionResponseStruct: Codable {
    let responses: [Response]?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        responses = try container.decodeIfPresent([Response].self, forKey: .responses)
    }
    
    // MARK: - Response
    struct Response: Codable {
        let landmarkAnnotations: [LandmarkAnnotation]?

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            landmarkAnnotations = try container.decodeIfPresent([LandmarkAnnotation].self, forKey: .landmarkAnnotations)
        }
    }

    // MARK: - LandmarkAnnotation
    struct LandmarkAnnotation: Codable {
        let mid, description: String?
        let score: Double?
        let boundingPoly: BoundingPoly?
        let locations: [Location]?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            mid = try container.decodeIfPresent(String.self, forKey: .mid)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            score = try container.decodeIfPresent(Double.self, forKey: .score)
            boundingPoly = try container.decodeIfPresent(BoundingPoly.self, forKey: .boundingPoly)
            locations = try container.decodeIfPresent([Location].self, forKey: .locations)
        }
    }

    // MARK: - BoundingPoly
    struct BoundingPoly: Codable {
        let vertices: [Vertex]?

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            vertices = try container.decodeIfPresent([Vertex].self, forKey: .vertices)
        }
    }

    // MARK: - Vertex
    struct Vertex: Codable {
        let x, y: Int?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            x = try container.decodeIfPresent(Int.self, forKey: .x)
            y = try container.decodeIfPresent(Int.self, forKey: .y)
        }
    }

    // MARK: - Location
    struct Location: Codable {
        let latLng: LatLng?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            latLng = try container.decodeIfPresent(LatLng.self, forKey: .latLng)
        }
    }

    // MARK: - LatLng
    struct LatLng: Codable {
        let latitude, longitude: Double?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
            longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)

        }
    }
}
