//
//  SearchResponse.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import Foundation

struct SearchResponse: Codable {
    var data: [ImageObject]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct ImageObject: Codable {
    var id: String
    var title: String
    var images: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id, title, images
    }
}

struct Image: Codable {
    var id, title, link: String?

    enum CodingKeys: String, CodingKey {
        case id, title, link
    }
}
