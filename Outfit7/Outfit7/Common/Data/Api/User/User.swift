//
//  User.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

struct User: Codable {
  let id: Int
  let name: String
  let username: String
  let email: String
  let phone: String
  let website: String
  let address: Address
  let company: Company
  
  struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
  }
  
  struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
    
    struct Geo: Codable {
      let lat: String
      let lng: String
    }
  }
}
