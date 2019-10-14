//
//  UIView+Extra.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

extension UIView {
  func setupAutoLayout() -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }
  
  class func setupAutoLayout() -> Self {
    let instance = self.init()
    instance.translatesAutoresizingMaskIntoConstraints = false
    return instance
  }
}
