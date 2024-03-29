//
//  StatisticsInteractor.swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol StatisticsBusinessLogic {
  func calculateStatistics(for userList: [User])
}

class StatisticsInteractor {
  var presenter: StatisticsPresentationLogic?
}

// MARK: - Business Logic
extension StatisticsInteractor: StatisticsBusinessLogic {
  func calculateStatistics(for userList: [User]) {
    presenter?.presentStatistics(for: userList)
  }
}
