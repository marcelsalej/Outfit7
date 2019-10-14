//
//  UITableview+Extra.swift
//  Outfit7
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

public extension UITableView {
  // MARK: - Register
  func register<T: UITableViewCell>(_: T.Type) {
    register(T.self, forCellReuseIdentifier: T.identifier)
  }
  
  // MARK: - Dequeue methods
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.identifier)")
    }
    return cell
  }
  
  func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, at indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      print("Could not dequeue cell with identifier \(T.identifier). Creating new instance")
      return T()
    }
    return cell
  }
  
  // MARK: - Helpers
  func deselectSelectedRow(animated: Bool = true) {
    indexPathForSelectedRow.map {
      deselectRow(at: $0, animated: animated)
    }
  }
}
