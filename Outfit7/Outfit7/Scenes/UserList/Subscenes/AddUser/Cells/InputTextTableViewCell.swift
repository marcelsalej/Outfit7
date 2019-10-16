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
    placeholderLabel.text = viewModel.placeholderLabel
    inputTextField.placeholder = viewModel.insertedString.isEmpty ? String(format: "Insert %@", viewModel.placeholderLabel) : viewModel.insertedString
    inputTextField.text = viewModel.insertedString
  }
}
// MARK: - UI setup
private extension InputTextTableViewCell {
  func setupViews() {
    setupPlaceholderLabel()
    setupInputTextField()
    setupPlaceHolderView()
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
    // datepicker toolbar setup
    let toolBar = UIToolbar()
    toolBar.barStyle = .default
    toolBar.isTranslucent = true
    let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didCloseInputText))
    toolBar.setItems([space, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
    toolBar.sizeToFit()
    inputTextField.inputView = toolBar
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
      $0.top.equalTo(inputTextField.snp.bottom).offset(15)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalTo(1)
      $0.bottom.equalToSuperview().inset(15)
    }
  }
}

// MARK: - View model
extension InputTextTableViewCell {
  struct ViewModel {
    let placeholderLabel: String
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
  
  @objc func didCloseInputText() {
    inputTextField.resignFirstResponder()
  }
}
