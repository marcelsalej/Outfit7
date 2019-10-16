//
//  KeyboardNotificationParser.swift
//  Outfit7
//
//  Created by Marcel Salej on 16/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol KeyboardNotificationParserProtocol {
  typealias KeyboardNotification = (animationDuration: CGFloat, keyboardSize: CGSize)
  func parse(from notification: Notification) throws -> KeyboardNotification
}

struct KeyboardNotificationParser: KeyboardNotificationParserProtocol {
  enum Error: Swift.Error {
    case parsingNotificationFailed
    
    var localizedDescription: String {
      switch self {
      case .parsingNotificationFailed:
        return "Notification contains invalid data!"
      }
    }
  }
  
  func parse(from notification: Notification) throws -> KeyboardNotificationParserProtocol.KeyboardNotification {
    guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size else { throw Error.parsingNotificationFailed }
    guard let animationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? CGFloat) else { throw Error.parsingNotificationFailed }
    return (animationDuration, keyboardSize)
  }
}
