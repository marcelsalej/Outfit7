//
//  AddUserRouter.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AddUserRoutingLogic {
  func dissmissAddUser()
  func dissmissAndSave(user: User)
}

protocol AddUserRouterDelegate: AnyObject {
  func dissmissViewController(addUserViewController: AddUserViewController)
  func dissmissAndSave(user: User, addUserViewController: AddUserViewController)
}

class AddUserRouter {
  weak var viewController: AddUserViewController?
  weak var delegate: AddUserRouterDelegate?
}

// MARK: - Routing Logic
extension AddUserRouter: AddUserRoutingLogic {
  func dissmissAndSave(user: User) {
    viewController.map {
      delegate?.dissmissAndSave(user: user, addUserViewController: $0)
    }
  }
  
  func dissmissAddUser() {
    viewController.map {
      delegate?.dissmissViewController(addUserViewController: $0)
    }
  }
}
