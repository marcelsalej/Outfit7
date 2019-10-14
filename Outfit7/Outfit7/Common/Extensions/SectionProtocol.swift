//
//  SectionProtocol.swift
//  Outfit7
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//
import Foundation

protocol SectionProtocol {
  associatedtype Row
  var rows: [Row] { get }
}
// MARK: - Section protocol
extension SectionProtocol {
  func row(at index: Int) -> Row? {
    return rows[index]
  }
}
