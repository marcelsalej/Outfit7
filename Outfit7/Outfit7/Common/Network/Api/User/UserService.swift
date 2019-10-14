//
//  UserService.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

class UserService {
  private let userDownloader: UserDownloader
  
  init(userDownloader: UserDownloader = .init()) {
    self.userDownloader = userDownloader
  }
}

// MARK: - Service implementation
extension UserService {
  func getUsersList(completion: @escaping ((Result<[User], NetworkError>) -> Void)) {
    // this is a great place to add localstorage/CoreData/Realm datastore implementation (inside loadUsersList of course)
    userDownloader.loadUsersList(completion: completion)
  }
}
