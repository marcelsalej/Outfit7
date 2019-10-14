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
  func deleteUser(userList: [User], removedUser: User)
}

class UserListInteractor {
  var presenter: UserListPresentationLogic?
  private let users: [User]? = try? User.mock()
}

// MARK: - Business Logic
extension UserListInteractor: UserListBusinessLogic {
  func fetchInitialUsersList() {
    users.map {
      self.presenter?.presentUserListSuccess(userList: $0)
      return
    }
    self.presenter?.presentUserListError()
  }
  
  func deleteUser(userList: [User], removedUser: User) {
    var users = userList
    users.firstIndex(where: {$0.id == removedUser.id }).map { id in
      users.remove(at: id)
      self.presenter?.presentUserListSuccess(userList: users)
    }
  }
}
