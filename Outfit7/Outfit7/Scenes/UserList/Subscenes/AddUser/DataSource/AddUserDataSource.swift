//
//  AddUserDataSource.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AddUserDataSource: NSObject, DataSourceProtocol {
  var sections: [AddUserSection] = []
}

// MARK: - Public Methods
extension AddUserDataSource {
  func setData(user: User?) {
    sections.removeAll()
    var rows = [AddUserRow]()
    rows.append(.inputText(.init(placeholderLabel: "Name:",
                                 insertedString: user?.name ?? "",
                                 validationStatus: .new)))
    rows.append(.inputText(.init(placeholderLabel: "Username:",
                                 insertedString: user?.username ?? "",
                                 validationStatus: .new)))
    rows.append(.inputText(.init(placeholderLabel: "Email:",
                                 insertedString: user?.email ?? "",
                                 validationStatus: .new)))
    rows.append(.inputDate(.init(placeholderText: "Birth date",
                                 insertedDate: user?.birthday,
                                 validationStatus: .new)))
    rows.append(.inputText(.init(placeholderLabel: "Salary",
                                 insertedString: user?.salary != nil ? String(format: "%.2f",
                                                                              user?.salary ?? "") : "",
                                 validationStatus: .new)))
    rows.append(.inputText(.init(placeholderLabel: "Rating",
                                 insertedString: user?.rating != nil ? String(format: "%2.f",
                                                                              user?.rating ?? "") : "",
                                 validationStatus: .new)))
    
    sections.append(.form(rows: rows))
  }
}

// MARK: - UITableView DataSource
extension AddUserDataSource: UITableViewDataSource {
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
    case .inputText(let viewModel):
      let cell = tableView.dequeueReusableCell(InputTextTableViewCell.self, at: indexPath)
      cell.setData(viewModel)
      return cell
    case .inputDate(let viewModel):
      let cell = tableView.dequeueReusableCell(InputDateTableViewCell.self, at: indexPath)
      cell.setData(viewModel)
      return cell
    }
  }
}
