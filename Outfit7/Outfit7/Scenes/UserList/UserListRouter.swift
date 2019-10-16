//
//  UserListRouter.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListRoutingLogic {
  func navigateToAddUser()
  func navigateToEditUser(user: User)
}

protocol UserListRouterDelegate: AnyObject {
}

class UserListRouter {
  weak var viewController: UserListViewController?
  weak var delegate: UserListRouterDelegate?
}

// MARK: - Routing Logic
extension UserListRouter: UserListRoutingLogic {
  func navigateToAddUser() {
    let addUserViewController = AddUserViewController(delegate: self, user: nil)
    viewController?.present(addUserViewController, animated: true)
  }
  
  func navigateToEditUser(user: User) {
    let addUserViewController = AddUserViewController(delegate: self, user: user)
    viewController?.navigationController?.pushViewController(addUserViewController, animated: true)
  }
}

// MARK: - AddUserRouterDelegate
extension UserListRouter: AddUserRouterDelegate {
  func dissmissViewController(addUserViewController: AddUserViewController) {
    addUserViewController.dismiss(animated: true)
  }
}
