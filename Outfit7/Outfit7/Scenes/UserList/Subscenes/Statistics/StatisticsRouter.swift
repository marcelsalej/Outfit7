//
//  StatisticsRouter.swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol StatisticsRoutingLogic {
  
}

protocol StatisticsRouterDelegate: AnyObject {
  
}

class StatisticsRouter {
  weak var viewController: StatisticsViewController?
  weak var delegate: StatisticsRouterDelegate?
}

// MARK: - Routing Logic
extension StatisticsRouter: StatisticsRoutingLogic {
  
}
