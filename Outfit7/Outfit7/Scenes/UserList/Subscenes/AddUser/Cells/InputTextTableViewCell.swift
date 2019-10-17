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
  private let placeholderView = UIView.setupAutoLayout()
  private let errorLabel = UILabel.setupAutoLayout()
  
  var editingEnded: ((String) -> Void)?
  
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
    placeholderLabel.text = viewModel.inputType.placeholderText.uppercased()
    inputTextField.placeholder = String(format: "Insert %@", viewModel.inputType.placeholderText)
    inputTextField.text = viewModel.insertedString
    switch viewModel.validationStatus {
    case .new, .valid:
      errorLabel.isHidden = true
    case .invalid(let error):
      errorLabel.text = error
      errorLabel.isHidden = false
    }
  }
}
// MARK: - UI setup
private extension InputTextTableViewCell {
  func setupViews() {
    selectionStyle = .none
    setupPlaceholderLabel()
    setupInputTextField()
    setupPlaceHolderView()
    setupErrorLabel()
  }
  
  func setupPlaceholderLabel() {
    addSubview(placeholderLabel)
    placeholderLabel.font = UIFont.boldSystemFont(ofSize: 12)
    placeholderLabel.textAlignment = .left
    placeholderLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupInputTextField() {
    addSubview(inputTextField)
    inputTextField.delegate = self
    inputTextField.snp.makeConstraints {
      $0.top.equalTo(placeholderLabel.snp.bottom).offset(5)
      $0.leading.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupPlaceHolderView() {
    addSubview(placeholderView)
    placeholderView.backgroundColor = .gray
    placeholderView.snp.makeConstraints {
      $0.top.equalTo(inputTextField.snp.bottom).offset(5)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalTo(1)
    }
  }
  
  func setupErrorLabel() {
    addSubview(errorLabel)
    errorLabel.textColor = .red
    errorLabel.font = .boldSystemFont(ofSize: 10)
    errorLabel.snp.makeConstraints {
      $0.top.equalTo(placeholderView.snp.bottom).offset(5)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.bottom.equalToSuperview().inset(10)
      $0.height.greaterThanOrEqualTo(15)
    }
  }
}

// MARK: - View model
extension InputTextTableViewCell {
  struct ViewModel {
    let inputType: InputType
    let insertedString: String
    let validationStatus: ValidationStatusType
  }
}

// MARK: UItextViewDelegate
extension InputTextTableViewCell: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    textField.resignFirstResponder()
    editingEnded?(textField.text ?? "")
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.becomeFirstResponder()
  }
}
