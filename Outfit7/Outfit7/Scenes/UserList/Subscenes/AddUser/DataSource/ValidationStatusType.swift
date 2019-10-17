//
//  ValidationStatusType.swift
//  Outfit7
//
//  Created by Marcel Salej on 16/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum ValidationStatusType {
  case new
  case valid
  case invalid(message: String)
}
