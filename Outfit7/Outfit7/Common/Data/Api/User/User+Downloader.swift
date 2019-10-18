//
//  User+Downloader.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

// MARK: - Downloader implementation
extension User {
  static func mock() throws -> [User] {
    return try Mocker.load(from: "UserResponse")
  }
}
