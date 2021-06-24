//
//  APIManager.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Abdulhalik on 19.06.2021.
//

import Foundation
import Alamofire

class APIManager {
  static let shared = APIManager()
  
  func callingRegisterAPI(register: RegisterModel, completionHandler:
    @escaping (Bool)->()) {
    let headers: HTTPHeaders = [
      .contentType("application/json")
    ]
    
    AF.request(REGISTER_URL, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response { response in
      debugPrint(response)
      
      switch response.result {
        case .success(let data):
          do {
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            print(response.result)
            if response.response?.statusCode == 200 {
              completionHandler(true)
            } else {
              completionHandler(false)
            }
          } catch {
            print(error.localizedDescription)
            completionHandler(false)
          }
        case .failure(let err):
          print(err.localizedDescription)
          completionHandler(false)
      }
    }
  }
  
  func callingLoginAPI(login: LoginModel, completionHandler:
    @escaping (Bool)->()) {
    let headers: HTTPHeaders = [
      .contentType("application/json")
    ]
    
    AF.request(LOGIN_URL, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
      debugPrint(response)
      
      switch response.result {
      case .success(let data):
        do {
          let json = try? JSONSerialization.jsonObject(with: data!, options: [])
          print(response.result)
          if response.response?.statusCode == 200 {
            completionHandler(true)
          } else {
            completionHandler(false)
          }
        } catch {
          print(error.localizedDescription)
          completionHandler(false)
        }
      case .failure(let err):
        print(err.localizedDescription)
        completionHandler(false)
      }
    }
  }
}
