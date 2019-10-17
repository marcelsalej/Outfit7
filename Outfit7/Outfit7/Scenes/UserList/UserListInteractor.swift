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
  func saveOrEditUser(user: User, userList: [User])
}

class UserListInteractor {
  var presenter: UserListPresentationLogic?
  private var users: [User]? = try? User.mock()
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
    users.firstIndex(where: { $0.id == removedUser.id }).map {
      users.remove(at: $0)
      presenter?.presentUserListSuccess(userList: users)
    }
  }
  
  func saveOrEditUser(user: User, userList: [User]) {
    var list = userList
    let existingUserIndex = userList.firstIndex { $0.id == user.id }
    existingUserIndex.map {
      list.remove(at: $0)
    }
    let newUser = User(id: user.id,
                       name: user.name,
                       birthday: user.birthday,
                       username: user.username,
                       email: user.email,
                       salary: user.salary,
                       rating: user.rating)
    list.append(newUser)
    presenter?.presentUserListSuccess(userList: list)
  }
}
