//
//  AddUserContentView.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AddUserContentView: UIView {
  let closeButton = UIButton(type: .close).setupAutoLayout()
  lazy var tableView = UITableView.setupAutoLayout()
  let saveButton = UIButton.setupAutoLayout()
 
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension AddUserContentView {
  func setupViews() {
    setupCloseButton()
    setupTableView()
    setupSaveButton()
  }
  
  func setupTableView() {
    addSubview(tableView)
    tableView.register(InputTextTableViewCell.self)
    tableView.register(InputDateTableViewCell.self)
    tableView.separatorStyle = .none
    tableView.snp.makeConstraints {
      $0.top.equalTo(closeButton.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview()
    }
  }
  
  func setupSaveButton() {
    addSubview(saveButton)
    saveButton.backgroundColor = .systemBlue
    saveButton.setTitle("Save".uppercased(), for: .normal)
    saveButton.setTitleColor(.white, for: .normal)
    saveButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
    saveButton.snp.makeConstraints {
      $0.top.equalTo(tableView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
      $0.height.equalTo(60)
    }
  }
  
  func setupCloseButton() {
    addSubview(closeButton)
    closeButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    closeButton.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(5)
      $0.trailing.equalToSuperview().inset(15)
      $0.width.height.equalTo(100)
    }
  }
}
