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
  private lazy var contentView = AddUserContentView.setupAutoLayout()
  private let dataSource = AddUserDataSource()
  private var user: User?
  
  init(delegate: AddUserRouterDelegate?, user: User?) {
    self.user = user
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
    setData()
  }
}

// MARK: - Set data
private extension AddUserViewController {
  func setData() {
    dataSource.setData(user: user)
    contentView.tableView.reloadData()
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
    contentView.backgroundColor = .white
    contentView.tableView.dataSource = dataSource
    contentView.closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    switch user {
    case .some:
      contentView.closeButton.isHidden = true
    case .none:
      contentView.closeButton.isHidden = false
    }
  }
}

private extension AddUserViewController {
  @objc func didTapCloseButton() {
    router?.dissmissAddUser()
  }
}
