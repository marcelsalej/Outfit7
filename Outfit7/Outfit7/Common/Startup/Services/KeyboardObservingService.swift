//
//  KeyboardObservingService.swift
//  Outfit7
//
//  Created by Marcel Salej on 16/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class KeyboardObservingService: Service {
  typealias KeyboardNotification = (animationDuration: CGFloat, keyboardSize: CGSize, isShown: Bool)
    let parser: KeyboardNotificationParserProtocol
    let observer: (KeyboardNotification) -> Void
    
    init(parser: KeyboardNotificationParserProtocol, observer: @escaping (KeyboardNotification) -> Void) {
      self.parser = parser
      self.observer = observer
    }
    
    func run(completion: @escaping (Bool) -> Void) {
      _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { self.processKeyboardNotification($0, shown: true) }
      _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { self.processKeyboardNotification($0, shown: false) }
    }
  }

  private extension KeyboardObservingService {
    func processKeyboardNotification(_ notification: Notification, shown: Bool) {
      do {
        let (animationDuration, keyboardSize) = try parser.parse(from: notification)
        observer((animationDuration: animationDuration,
                  keyboardSize: keyboardSize,
                  isShown: shown))
      } catch {
        Logger.error("Error parsing keyboard notification: \(error.localizedDescription)")
      }
    }
}
