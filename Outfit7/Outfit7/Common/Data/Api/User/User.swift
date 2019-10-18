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
  let birthday: Date
  let username: String
  let email: String
  let salary: Double
  let rating: Double
}
