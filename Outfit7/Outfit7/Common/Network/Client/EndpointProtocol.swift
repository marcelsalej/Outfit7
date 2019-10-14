//
//  EndpointProtocol.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol EndpointProtocol {
  typealias Path = String
  var path: Path { get }
  var url: String { get }
}

extension EndpointProtocol {
  var url: String {
    return String(format: "%@%@", Configuration.baseUrl, path)
  }
}

extension EndpointProtocol where Self: RawRepresentable, Self.RawValue == String {
  var path: String {
    return rawValue
  }
}
