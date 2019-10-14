//
//  AddUserRouter.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AddUserRoutingLogic {
  
}

protocol AddUserRouterDelegate: AnyObject {
  
}

class AddUserRouter {
  weak var viewController: AddUserViewController?
  weak var delegate: AddUserRouterDelegate?
}

// MARK: - Routing Logic
extension AddUserRouter: AddUserRoutingLogic {
  
}
