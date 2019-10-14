//
//  UICollectionView+Extra.swift
//  Outfit7
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

extension UICollectionView {
  // MARK: - Register
  func register<T: UICollectionViewCell>(_: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.identifier)
  }
  
  // MARK: - Dequeue methods
  func dequeueReusableCel<T: UICollectionViewCell>(at indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.identifier)")
    }
    return cell
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(_ cell: T.Type, at indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      print("Could not dequeue cell with identifier: \(T.identifier). Creating new instance.")
      return T()
    }
    return cell
  }
}
