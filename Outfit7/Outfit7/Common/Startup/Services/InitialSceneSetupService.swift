//
//  InitialSceneSetupService.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class InitialSceneSetupService: Service {
  private let completion: (AppFlowController) -> Void
  
  init(completion: @escaping (AppFlowController) -> Void) {
    self.completion = completion
  }
  
  // MARK: - Run block
  func run(completion: @escaping (Bool) -> Void) {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let appFlowController = AppFlowController(window: window)
    appFlowController.showInitialController()
    self.completion(appFlowController)
    completion(true)
  }
}
