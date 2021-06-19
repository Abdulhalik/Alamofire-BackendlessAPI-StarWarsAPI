//
//  Displayable.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Desi Mac Book 1 on 19.06.2021.
//

import Foundation

protocol Displayable {
  var titleLabelText: String { get }
  var subtitleLabelText: String { get }
  var item1: (label: String, value: String) { get }
  var item2: (label: String, value: String) { get }
  var item3: (label: String, value: String) { get }
  var listTitle: String { get }
  var listItems: [String] { get }
}
