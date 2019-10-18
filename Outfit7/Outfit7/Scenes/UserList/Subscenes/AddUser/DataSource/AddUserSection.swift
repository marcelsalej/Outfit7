//
//  AddUserSection.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum AddUserSection: SectionProtocol {
  case form(rows: [AddUserRow])
  
  var rows: [AddUserRow] {
    switch self {
    case .form(let rows):
      return rows
    }
  }
}
