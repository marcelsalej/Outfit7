//
//  InputType .swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum InputType {
  case name
  case username
  case email
  case birthdate
  case salary
  case rating
  
  var placeholderText: String {
    switch self {
    case .name:
      return "Name"
    case .username:
      return "Username"
    case .email:
      return "Email"
    case .birthdate:
      return "Birth date"
    case .salary:
      return "Salary"
    case .rating:
      return "Rating"
    }
  }
  
  var validations: [ValidationType] {
    switch self {
    case .name:
      return [.empty]
    case .username:
      return [.empty]
    case .email:
      return [.email, .empty]
    case .birthdate:
      return [.empty]
    case .salary:
      return [.empty]
    case .rating:
      return [.empty]
    }
  }
}
