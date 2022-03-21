//
//  movie.swift
//  PrographyQuest
//
//  Created by 이범준 on 2022/02/07.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let status: String?
    let statusMessage: String?
    let data: DataClass?

}

// MARK: - DataClass
struct DataClass: Codable {
    let movieCount: Int?
    let limit: Int?
    let movies: [Movie]?
    
}

// MARK: - Movie
struct Movie: Codable {
    let title: String?
    let rating: Double?
    let small_cover_image: String?
}
