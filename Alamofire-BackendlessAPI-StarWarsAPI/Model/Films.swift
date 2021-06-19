//
//  Films.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Desi Mac Book 1 on 19.06.2021.
//

import Foundation

struct Films: Decodable {
  let count: Int
  let all: [Film]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
