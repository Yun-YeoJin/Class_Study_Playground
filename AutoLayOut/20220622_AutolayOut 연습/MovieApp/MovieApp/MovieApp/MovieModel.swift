//
//  MovieModel.swift
//  MovieApp
//
//  Created by 윤여진 on 2022/07/01.
//

import Foundation

struct MovieModel: Codable {
    
    let resultCount: Int
    let results: [MovieResult]
    
}

struct MovieResult: Codable {
    //optional로 해야함, 타입이 강제로 지정되면 무조건 있다고 인식되기 때문에.
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate : String?
    
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
        case releaseDate
}
}
