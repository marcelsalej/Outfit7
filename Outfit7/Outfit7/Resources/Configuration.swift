//
//  Configuration.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

struct Configuration {
  static let baseUrl = "https://jsonplaceholder.typicode.com"
  
  static var dateFormatter: DateFormatter {
    get {
      let formatter = DateFormatter()
      formatter.dateFormat = "dd-MM-YYYY"
      return formatter
    }
  }
}
