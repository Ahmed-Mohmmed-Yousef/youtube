//
//  Model.swift
//  Youtube
//
//  Created by Ahmed on 5/27/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import Foundation


class Model {
    
    func getVideos(){

        // Create URL object
        guard let url = URL(string: Constants.API_URL) else { return }
        
        // Create URLSesion objrct
        let session = URLSession.shared
        
        // Get dataTask from URLSession object
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            // Checkif there is an error
            if error != nil || data == nil{
                return
            }
             
            // parsing the data to video
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                print(response.items?[1].title)
            } catch {
                print("EEEEEEEEE")
            }
            
        }
        
        dataTask.resume()
    }
}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let kind, etag, nextPageToken: String
    let items: [Item]
    let pageInfo: PageInfo
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: Date
    let channelID, title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle, playlistID: String
    let position: Int
    let resourceID: ResourceID

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle
        case playlistID = "playlistId"
        case position
        case resourceID = "resourceId"
    }
}

// MARK: - ResourceID
struct ResourceID: Codable {
    let kind, videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default
    let maxres: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}
