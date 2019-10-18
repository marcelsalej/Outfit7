//
//  UserListDataSource.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol UserListDataSourceDelegate: AnyObject {
  func willRemoveUser(at indexPath: IndexPath)
}

class UserListDataSource: NSObject, DataSourceProtocol {
  var sections: [UserListSection] = []
  weak var delegate: UserListDataSourceDelegate?
}

// MARK: - Public Methods
extension UserListDataSource {
  func setData(users: [User]) {
    sections.removeAll()
    var rows = [UserListRow]()
    users.forEach {
      rows.append(.user(.init(id: $0.id ?? 0,
                              name: $0.name,
                              birthDate: $0.birthday,
                              salary: $0.salary,
                              rating: $0.rating)))
    }
    sections.append(.userList(rows: rows))
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
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .delete:
      deleteUser(from: tableView, at: indexPath)
      delegate?.willRemoveUser(at: indexPath)
    default:
      break
    }
  }
}

extension UserListDataSource {
  func deleteUser(from tableView: UITableView, at indexPath: IndexPath) {
     guard var rows = section(at: 0)?.rows else {
      return
    }
    rows.remove(at: indexPath.row)
    sections.removeAll()
    sections.append(.userList(rows: rows))
    tableView.deleteRows(at: [indexPath], with: .fade)
  }
}
