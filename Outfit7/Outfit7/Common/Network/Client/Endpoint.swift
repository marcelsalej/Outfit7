//
//  Endpoint.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum Endpoint {}

extension Endpoint {
  enum User: EndpointProtocol {
    case userList
    
    // Add other endpoint regarded to user if needed
    var path: String {
      switch self {
      case .userList:
        return "/users"
      }
    }
  }
}
