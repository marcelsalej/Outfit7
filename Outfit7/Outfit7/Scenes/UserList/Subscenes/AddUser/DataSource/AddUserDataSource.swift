//
//  AddUserDataSource.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AddUserDataSource: NSObject, DataSourceType {
  var sections: [AddUserSection] = []
  
  //init(data ...) {
  //  // generate sections
  //}
}

// MARK: - Public Methods
extension AddUserDataSource {
  //func setData(...) {
  //  // generate section
  //  //sections = [section]
  //}
}

// MARK: - UITableView DataSource
extension AddUserDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRowsInSection(at: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let row = section(at: indexPath.section)?.row(at: indexPath.row) else {
      Logger.error("No available row in dataSource at given indexPath \(indexPath)!")
      return UITableViewCell()
    }
    
    switch row {
      // return cell for each type
    }
  }
}
