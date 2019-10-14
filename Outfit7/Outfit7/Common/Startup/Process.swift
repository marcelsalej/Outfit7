//
//  Process.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

final class Process {
  public init() {}
  
  @discardableResult
  public func execute(service: Service) -> Process {
    service.run {
      guard $0 else { return }
      print("Successfully ran the \(type(of: $0)) process.")
    }
    return self
  }
}
