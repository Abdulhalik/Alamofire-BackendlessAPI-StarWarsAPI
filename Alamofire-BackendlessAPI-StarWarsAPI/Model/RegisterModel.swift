//
//  RegisterModel.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Abdulhalik on 19.06.2021.
//

import Foundation

struct RegisterModel: Encodable {
  let name: String
  let email: String
  let password: String
}
