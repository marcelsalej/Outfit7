//
//  Mocker.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

class Mocker {
  static func load<T:Decodable>(from file: String, type: String = "json") throws -> T {
    guard let path = Bundle.main.path(forResource: file, ofType: type) else {
      throw NSError()
    }
    
    let url = URL(fileURLWithPath: path)
    let data = try Data(contentsOf: url)
    let decoder = JSONDecoder.default
    let object = try decoder.decode(T.self, from: data)
    return object
  }
}
