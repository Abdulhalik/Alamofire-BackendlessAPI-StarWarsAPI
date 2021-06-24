//
//  Film.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Abdulhalik on 19.06.2021.
//

import Foundation

struct Film: Decodable {
  let id: Int
  let title: String
  let openingCrawl: String
  let director: String
  let producer: String
  let releaseDate: String
  let starships: [String]
  
  enum CodingKeys: String, CodingKey {
    case id = "episode_id"
    case title
    case openingCrawl = "opening_crawl"
    case director
    case producer
    case releaseDate = "release_date"
    case starships
  }
}

extension Film: Displayable {
  
  var titleLabelText: String {
    title
  }
  
  var subtitleLabelText: String {
    "Episode \(String(id))"
  }
  
  var item1: (label: String, value: String) {
    ("Director", director)
  }
  
  var item2: (label: String, value: String) {
    ("Producer", producer)
  }
  
  var item3: (label: String, value: String) {
    ("Release Date", releaseDate)
  }
  
  var listTitle: String {
    "Starships"
  }
  
  var listItems: [String] {
    starships
  }
}
