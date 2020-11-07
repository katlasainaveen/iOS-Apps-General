//
//  Video.swift
//  Youtube App
//
//  Created by Sai Naveen Katla on 05/10/20.
//

import Foundation

struct Response: Decodable {
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
}

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContanier = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.published = try snippetContanier.decode(Date.self, forKey: .published)
        self.title = try snippetContanier.decode(String.self, forKey: .title)
        self.description = try snippetContanier.decode(String.self, forKey: .description)
        
        let thumbnailsContainer = try snippetContanier.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resoureIdContainer = try snippetContanier.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resoureIdContainer.decode(String.self, forKey: .videoId)
    }
    
}
