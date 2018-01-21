//
//  Show.swift
//  glance
//
//  Created by Andrew Tsukuda on 1/20/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import Foundation

struct Show {
    let name: String
    let status: String
    let summary: String
    let imageUrl: String
    let rating: Double?
}

extension Show: Decodable {
    enum CodingKeys: String, CodingKey {
        case show
    }
    
    enum ShowKeys: String, CodingKey {
        case name
        case summary
        case status
        case image
        case rating
    }
    
    enum ImageKeys: String, CodingKey {
        case medium
    }
    
    enum RatingKeys: String, CodingKey {
        case average
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let showContainer = try container.nestedContainer(keyedBy: ShowKeys.self, forKey: .show)
        name = try showContainer.decodeIfPresent(String.self, forKey: .name) ?? "MEEEE"
        summary = try showContainer.decodeIfPresent(String.self, forKey: .summary) ?? "Fake Summary"
        status = try showContainer.decode(String.self, forKey: .status)
        
        let imageContainer = try showContainer.nestedContainer(keyedBy: ImageKeys.self, forKey: .image)
        imageUrl = try imageContainer.decode(String.self, forKey: .medium)
        
        let ratingContainer = try showContainer.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        rating = try ratingContainer.decodeIfPresent(Double.self, forKey: .average)
        
        
    }
}


