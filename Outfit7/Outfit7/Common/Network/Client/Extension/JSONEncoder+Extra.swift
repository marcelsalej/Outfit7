//
//  JSONEncoder+Extra.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation
extension JSONEncoder {
  static var `default`: JSONEncoder {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    return encoder
  }
}
