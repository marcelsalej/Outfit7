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
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.backgroundColor = .white
    contentView.tableView.dataSource = dataSource
    contentView.closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    contentView.saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    switch user {
    case .some:
      contentView.closeButton.removeFromSuperview()
      contentView.tableView.snp.makeConstraints {
        $0.top.equalToSuperview()
      }
    case .none:
      contentView.closeButton.isHidden = false
    }
  }
}

private extension AddUserViewController {
  @objc func didTapCloseButton() {
    router?.dissmissAddUser()
  }
  
  @objc func didTapSaveButton() {
    switch dataSource.validateAll() {
    case true:
      guard let name = dataSource.getValidViewModel(inputType: .name),
        let email = dataSource.getValidViewModel(inputType: .email),
        let username = dataSource.getValidViewModel(inputType: .username),
        let birthDate = dataSource.getValidViewModel(inputType: .birthdate),
        let salary = dataSource.getValidViewModel(inputType: .salary),
        let rating = dataSource.getValidViewModel(inputType: .rating),
        let birthdayDate = Configuration.dateFormatter.date(from: birthDate),
        let salaryDouble = Double(salary),
        let ratingDouble = Double(rating.replacingOccurrences(of: " ", with: "")) else { return }
      
      user.map {
        router?.dissmissAndSave(user: User(id: $0.id,
                                           name: name,
                                           birthday: birthdayDate,
                                           username: username,
                                           email: email,
                                           salary: salaryDouble,
                                           rating: ratingDouble))
        return
      }
      router?.dissmissAndSave(user: User(id: 0,
                                         name: name,
                                         birthday: birthdayDate,
                                         username: username,
                                         email: email,
                                         salary: salaryDouble,
                                         rating: ratingDouble))
    case false:
      break
    }
  }
}
