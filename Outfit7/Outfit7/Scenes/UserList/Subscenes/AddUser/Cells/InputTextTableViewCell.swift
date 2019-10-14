//
//  InputTextTableViewCell.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//
//

import UIKit

class InputTextTableViewCell: UITableViewCell {
  private let placeholderLabel = UILabel.setupAutoLayout()
  private let inputTextField = UITextField.setupAutoLayout()
  
  // MARK: - Init methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Set data
extension InputTextTableViewCell {
  func setData(_ viewModel: ViewModel) {
    placeholderLabel.text = viewModel.placeholderLabel
    inputTextField.text = viewModel.insertedString
  }
}
// MARK: - UI setup
private extension InputTextTableViewCell {
  func setupViews() {
    setupPlaceholderLabel()
    setupInputTextField()
  }
  
  func setupPlaceholderLabel() {
    addSubview(placeholderLabel)
    placeholderLabel.font = UIFont.boldSystemFont(ofSize: 12)
    placeholderLabel.textAlignment = .left
    placeholderLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
  }
  
  func setupInputTextField() {
    addSubview(inputTextField)
    inputTextField.snp.makeConstraints {
      $0.top.equalTo(placeholderLabel.snp.bottom).offset(5)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

// MARK: - View model
extension InputTextTableViewCell {
  struct ViewModel {
    let placeholderLabel: String
    let insertedString: String
  }
}
