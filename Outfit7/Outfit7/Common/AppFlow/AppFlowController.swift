//
//  AppFlowController.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AppFlowController {
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
    self.window.makeKeyAndVisible()
    showInitialController()
  }
}

// MARK: - Public methods
extension AppFlowController {
  func showInitialController() {
    // initialize initial controller here
    let initialViewController = UserListViewController(delegate: self)
    let navigationController = UINavigationController(rootViewController: initialViewController)
    window.rootViewController = navigationController
  }
  
  func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = UIViewController()
    window.windowLevel = UIWindow.Level.normal + 1
    window.makeKeyAndVisible()
    window.rootViewController?.present(viewController, animated: animated, completion: completion)
  }
}

extension AppFlowController: UserListRouterDelegate {}
