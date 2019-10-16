//
//  AppDelegate.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol AppEventObserver {
  func keyboardWillShow(animationDuration: CGFloat, keyboardSize: CGSize)
  func keyboardWillHide(animationDuration: CGFloat, keyboardSize: CGSize)
}

extension AppEventObserver {
  func keyboardWillShow(animationDuration: CGFloat, keyboardSize: CGSize) {}
  func keyboardWillHide(animationDuration: CGFloat, keyboardSize: CGSize) {}
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  private var appFlowController: AppFlowController?
  let appEventsBroadcast = Broadcast<AppEventObserver>()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    Process().execute(service: InitialSceneSetupService { self.appFlowController = $0 })
    Process().execute(service: KeyboardObservingService(parser: KeyboardNotificationParser(),
                                                        observer: { [weak self] notification in
      self?.appEventsBroadcast.invoke {
        notification.isShown ?
          $0.keyboardWillShow(animationDuration: notification.animationDuration, keyboardSize: notification.keyboardSize) :
          $0.keyboardWillHide(animationDuration: notification.animationDuration, keyboardSize: notification.keyboardSize)
      }
    }))
    return true
  }
}

