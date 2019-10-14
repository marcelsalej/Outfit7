//
//  DatasourceProtocol.swift
//  Outfit7
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol DataSourceProtocol {
  associatedtype Section: SectionProtocol
  var sections: [Section] { get set }
}

// MARK: - DatasourceProtocol
extension DataSourceProtocol {
  func numberOfSections() -> Int {
    return sections.count
  }
  
  func numberOfRows(in section: Int) -> Int {
    guard let section = sections[safe: section] else { return 0 }
    return section.rows.count
  }
  
  func section(at index: Int) -> Section? {
    return sections[safe: index]
  }
}

extension  DataSourceProtocol {
  subscript(_ indexPath: IndexPath) -> Section.Row? {
    return section(at: indexPath.section)?.row(at: indexPath.row)
  }
}
