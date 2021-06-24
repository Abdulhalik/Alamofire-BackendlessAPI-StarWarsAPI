//
//  UserPreferences.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Abdulhalik on 19.06.2021.
//

import Foundation

class UserPreferences {
  
  static let PASSWORD           = "PASSWORD"
  static let FIRST_ENTERANCE    = "FIRST_ENTERANCE"
  static let IS_LOGGED_IN       = "IS_LOGGED_IN"
  
  class func InitializePreferences()
  {

  }
  
  class func GetBool(forKey:String) -> Bool
  {
      return UserDefaults.standard.bool(forKey: forKey);
  }
  
  class func GetInt(forKey:String) -> Int
  {
      return UserDefaults.standard.integer(forKey: forKey);
  }
  
  class func GetString(forKey:String) -> String?
  {
      let val = UserDefaults.standard.string(forKey: forKey)
      
      if(val == nil){
          return ""
      }
      
      return val;
  }
  
  class func SetInt(forKey:String, val:Int)
  {
       UserDefaults.standard.set(val, forKey: forKey);
  }
  
  class func SetString(forKey:String, val:String)
  {
      UserDefaults.standard.set(val, forKey: forKey);
  }
  
  class func SetBool(forKey:String, val:Bool)
  {
      UserDefaults.standard.set(val, forKey: forKey);
  }
}

