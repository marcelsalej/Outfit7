//
//  UserListDataSource.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class UserListDataSource: NSObject, DataSourceProtocol {
  var sections: [UserListSection] = []
}

// MARK: - Public Methods
extension UserListDataSource {
  func setData(users: [User]) {
    // generate section
    
  }
}

// MARK: - UITableView DataSource
extension UserListDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRows(in: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let row = section(at: indexPath.section)?.row(at: indexPath.row) else {
      Logger.error("No available row in dataSource at given indexPath \(indexPath)!")
      return UITableViewCell()
    }
    
    switch row {
    case .user(let viewModel):
      let cell = tableView.dequeueReusableCell(UserTableViewCell.self, at: indexPath)
      cell.setData(viewModel)
      return cell
    }
  }
}
