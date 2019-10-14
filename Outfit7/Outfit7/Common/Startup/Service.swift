//
//  StartupService.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

public protocol Service {
  func run(completion: @escaping (Bool) -> Void)
}

extension Service {
  public var serviceId: String {
    return UUID().uuidString
  }
}
