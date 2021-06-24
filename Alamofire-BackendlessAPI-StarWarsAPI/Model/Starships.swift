//
//  Starships.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Abdulhalik on 19.06.2021.
//

import Foundation

struct Starships: Decodable {
  var count: Int
  var all: [Starship]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
