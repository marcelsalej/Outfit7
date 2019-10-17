//
//  KeyboardSetupService.swift
//  Outfit7
//
//  Created by Marcel Salej on 16/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import IQKeyboardManagerSwift

class KeyboardSetupService: Service {
    
  // MARK: - Run block
  func run(completion: @escaping (Bool) -> Void) {
    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
    IQKeyboardManager.shared.previousNextDisplayMode = .default
  }
}
