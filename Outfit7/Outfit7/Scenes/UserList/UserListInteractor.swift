//
//  UserListInteractor.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListBusinessLogic {
  func fetchInitialUsersList()
}

class UserListInteractor {
  var presenter: UserListPresentationLogic?
  private let users: [User]? = try? User.mock()
}

// MARK: - Business Logic
extension UserListInteractor: UserListBusinessLogic {
  func fetchInitialUsersList() {
    print("Users: \(users)")
  }
}
