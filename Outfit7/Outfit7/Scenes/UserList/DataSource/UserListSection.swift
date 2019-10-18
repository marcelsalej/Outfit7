//
//  UserListSection.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum UserListSection: SectionProtocol {
  // defines cases for each section, e.g. `case history(rows: [HistoryRow])`
  case userList(rows: [UserListRow])
  
  var rows: [UserListRow] {
    switch self {
    case .userList(let rows):
      return rows
    }
  }
}
