//
//  UIFont+Extra.swift
//  Outfit7
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

// In case of different fonts
enum FontFamily: String {
  case centraNo2 = "CentraNo2"
}

enum FontStyle: String {
  case black = "Black"
  case blackItalic = "BlackItalic"
  case bold = "Bold"
  case boldItalic = "BoldItalic"
  case book = "Book"
  case bookItalic = "BookItalic"
  case extraBold = "ExtraBold"
  case extraBoldItalic = "ExtraBoldItalic"
  case hairline = "Hairline"
  case hairlineItalic = "HairlineItalic"
  case light = "Light"
  case lightItalic = "LightItalic"
  case medium = "Medium"
  case mediumItalic = "MediumItalic"
  case thin = "Thin"
  case thinItalic = "ThinItalic"
}

extension UIFont {
  static func custom(family: FontFamily = .centraNo2, style: FontStyle, size: CGFloat) -> UIFont {
    let name = String(format: "%@-%@", family.rawValue, style.rawValue)
    //TODO: - Add font files!
    return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
  }
}
