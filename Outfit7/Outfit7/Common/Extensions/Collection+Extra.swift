//
//  Collection+Extra.swift
//  Outfit7
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

public extension Collection {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
  
  func count(where clause: (Element) -> Bool) -> Int {
    return lazy.filter(clause).count
  }
}
