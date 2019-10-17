//
//  ValidationType.swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum ValidationType {
  case empty
  case email
  
  mutating func validationMessage(inputType: InputType) -> String {
    switch self {
    case .email:
      return String(format: "%@ is not a valid email", inputType.placeholderText)
    case .empty:
      return String(format: "%@ should not be empty", inputType.placeholderText)
    }
  }
}
