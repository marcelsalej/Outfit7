//
//  UserListPresenter.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListPresentationLogic {
  func presentUserListSuccess(userList: [User])
  func presentUserListError()
}

class UserListPresenter {
  weak var viewController: UserListDisplayLogic?
}

// MARK: - Presentation Logic
extension UserListPresenter: UserListPresentationLogic {
  func presentUserListSuccess(userList: [User]) {
    let sortedList = userList.sorted { $0.name < $1.name }
    viewController?.displayUserListSuccess(user: sortedList)
  }
  
  func presentUserListError() {
    viewController?.displayUserListError()
  }
}
