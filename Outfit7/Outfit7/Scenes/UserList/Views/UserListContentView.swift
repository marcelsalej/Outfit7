//
//  UserListContentView.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class UserListContentView: UIView {
  let activityIndicatorView = UIActivityIndicatorView.setupAutoLayout()
  lazy var tableView = UITableView.setupAutoLayout()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension UserListContentView {
  func setupViews() {
    setupTableView()
  }
  
  func setupTableView() {
    addSubview(tableView)
    tableView.register(UserTableViewCell.self)
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

// MARK: - Loader
extension UserListContentView {
  func toggleLoading(_ isLoading: Bool) {
    UIView.animate(withDuration: 0.2) {
      self.tableView.alpha = isLoading ? 0 : 1
      self.activityIndicatorView.alpha = isLoading ? 1 : 0
    }
    isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
  }
}
