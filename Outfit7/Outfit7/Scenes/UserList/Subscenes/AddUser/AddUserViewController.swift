//
//  AddUserViewController.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol AddUserDisplayLogic: AnyObject {
  
}

class AddUserViewController: UIViewController {
  var interactor: AddUserBusinessLogic?
  var router: AddUserRoutingLogic?
  private lazy var contentView = AddUserContentView.autolayoutView()
  
  init(delegate: AddUserRouterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    let interactor = AddUserInteractor()
    let presenter = AddUserPresenter()
    let router = AddUserRouter()
    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.delegate = delegate
    self.interactor = interactor
    self.router = router
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
}

// MARK: - Display Logic
extension AddUserViewController: AddUserDisplayLogic {
  
}

// MARK: - Private Methods
private extension AddUserViewController {
  func setupViews() {
    // setup title, background, navigation buttons, etc
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    // add constraints
  }
}
