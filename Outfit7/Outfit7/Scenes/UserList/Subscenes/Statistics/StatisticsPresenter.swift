//
//  StatisticsPresenter.swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol StatisticsPresentationLogic {
  func presentStatistics(for userList: [User])
}

class StatisticsPresenter {
  weak var viewController: StatisticsDisplayLogic?
}

// MARK: - Presentation Logic
extension StatisticsPresenter: StatisticsPresentationLogic {
  func presentStatistics(for userList: [User]) {
    viewController?.displayStatisticsView(viewModel: .init(avgSalary: calculateAvgSalary(for: userList),
                                                           avgAge: calculateAvgAge(for: userList),
                                                           maxRating: calculateMaxRating(for: userList) ?? 0))
  }
}

private extension StatisticsPresenter {
  func calculateAvgSalary(for userList: [User]) -> Double {
    let salaries: [Double] = userList.compactMap { $0.salary }
    return salaries.reduce(0, +) / Double(userList.count)
  }
  
  func calculateAvgAge(for userList: [User]) -> Double {
    let ages: [TimeInterval] = userList.compactMap { $0.birthday.timeIntervalSinceNow }
    return ages.reduce(0.0, +) / Double(userList.count)
  }
  
  func calculateMaxRating(for userList: [User]) -> Double? {
    let ratings: [Double] = userList.compactMap { $0.rating }
    let sortedRatings = ratings.sorted { $0 > $1 }
    return sortedRatings.first
  }
}
