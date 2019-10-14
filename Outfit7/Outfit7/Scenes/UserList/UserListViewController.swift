//
//  UserListViewController.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol UserListDisplayLogic: AnyObject {
  
}

class UserListViewController: UIViewController {
  var interactor: UserListBusinessLogic?
  var router: UserListRoutingLogic?
  private lazy var contentView = UserListContentView.setupAutoLayout()
  
  init(delegate: UserListRouterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    let interactor = UserListInteractor()
    let presenter = UserListPresenter()
    let router = UserListRouter()
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
    fetchUserList()
  }
}

// MARK: - Load data
extension UserListViewController {
  func fetchUserList() {
    interactor?.fetchInitialUsersList()
  }
}

// MARK: - Display Logic
extension UserListViewController: UserListDisplayLogic {
  
}

// MARK: - Private Methods
private extension UserListViewController {
  func setupViews() {
    // setup title, background, navigation buttons, etc
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    // add constraints
  }
}
