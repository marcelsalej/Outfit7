//
//  InputDateTableViewCell.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class InputDateTableViewCell: UITableViewCell {
  private let placeholderLabel = UILabel.setupAutoLayout()
  private let inputDateTextField = UITextField.setupAutoLayout()
  
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
extension InputDateTableViewCell {
  func setData(_ viewModel: ViewModel) {
    placeholderLabel.text = viewModel.placeholderText
    viewModel.insertedDate.map {
      inputDateTextField.text = Configuration.dateFormatter.string(from: $0)
      return
    }
    inputDateTextField.text = "DD/MM/YYYY"
  }
}
// MARK: - UI setup
private extension InputDateTableViewCell {
  func setupViews() {
    setupPlaceholderLabel()
    setupInputDateTextField()
  }
  
  func setupPlaceholderLabel() {
    addSubview(placeholderLabel)
    placeholderLabel.font = UIFont.boldSystemFont(ofSize: 12)
    placeholderLabel.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview()
    }
  }
  
  func setupInputDateTextField() {
    addSubview(inputDateTextField)
    inputDateTextField.snp.makeConstraints {
      $0.top.equalTo(inputDateTextField.snp.bottom).offset(5)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

// MARK: - View model
extension InputDateTableViewCell {
  struct ViewModel {
    let placeholderText: String
    let insertedDate: Date?
  }
}
